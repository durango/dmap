$new_block = ERB.new <<-EOF
class <%= table.camelcase %>
  include DataMapper::Resource
<%
  $str = ''
  properties.each do |k, val|
      $str += '  property :' + k
      $str += ', ' + val["type"] unless val["type"].nil?
    val.each do |key, v|
      next if key == "type" or v.nil?
      keys = DMap::Render.run key, v
      keys.each do |field, value|
        next if value.nil? or value == ""

        $str += ', :' + key + ' => '
        # Add strings around values that need it
        if value.class.name == "String" and value.split(' ').length > 1
          $str += '"' + value + '"'
        # Turn a string into an "Array"
        elsif value.class.name == "Array"
          $str += '[' + value.join(', ') + ']'
        else
          value = DMap::Helpers.run(value)
          $str += value.to_s
        end
      end
    end
    $str += "\n"
  end

  $str += "\n"

  validations.each do |field, value|
    value.each do |key, v|
      $str += "  validates_" + key + " :" + field + ", "
      v.each do |k, cmd|
        next if k == :null

        cmd = ":" + field if cmd == :self
        cmd = '"' + cmd + '"' if cmd.is_a? String
        k = ":" + k.to_s if k.is_a? Symbol
        cmd = ":" + cmd.to_s if cmd.is_a? Symbol
        cmd = "[" + cmd.join(', ') + "]" if cmd.is_a? Array

        keys = DMap::Render.run k, cmd
        keys.each do |index, item|
          item = item.gsub(/^"/, "" ).gsub(/"$/m, "" )
          if item.is_a?(String) and item.split(' ').length > 1 and item.match(/^\\[/).nil?
            item = '"' + item + '"'
          end
          $str += k.to_s + " => " + item + ", "
        end
      end
      $str.slice!(-2)
      $str += "\n"
    end

    $str += "\n" if associations.length > 0
    associations.each do |field, value|
      value.each do |key, v|
        $str += '  ' + DMap::Associations.const_get(key.camelcase).method('field').call
        $str += ':' + v[:fields].to_s + ', ' unless v[:fields].nil?
        unless v[:through].empty?
          $str += ':through => '
          if v[:through].is_a? Symbol
            $str += ':' + v[:through].to_s
          else
            $str += v[:through].to_s
          end
          $str += ', '
        end
        $str.slice!(-2)
        $str += "\n"
      end
    end
  end
%>
<%= $str %>
end
EOF