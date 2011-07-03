$new_block = ERB.new <<-EOF
class <%= table[0] %>
  include DataMapper::Resource
<%
  $str = ''
  properties.each do |k, val|
      $str += '  property :' + k
      $str += ', ' + val["type"] unless val["type"].nil?
    val.each do |key, v|
      next if key == "type"
      v = ":" + v if v == "protected" || v == "private" || v == "public"
      $str += ', :' + key + ' => ' + v.to_s
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
        cmd = '"' + cmd + '"' if cmd.is_a?(String)
        k = ":" + k.to_s if k.is_a?(Symbol)
        cmd = ":" + cmd.to_s if cmd.is_a?(Symbol)
        cmd = "[" + cmd.map {|x| ":" + x}.join(', ') + "]" if cmd.is_a?(Array)

        $str += k.to_s + " => " + cmd.to_s + ", "
      end
      $str.slice!(-2)
      $str += "\n"
    end
  end
%>
<%= $str %>
end
EOF