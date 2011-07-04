# We'll be needing to convert to CamelCase and under_score quite a bit 
class String
  def camelcase
    self.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
  end

  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

# DMap Core functions + Table and Fields
module DMap
  # List available commands here
  class Commands
    attr_accessor :options

    def self.exists?(command)
      self.respond_to? "cmd_" + command
    end

    def self.options
      @options ||= OrderedHash.new
    end

    # Each command has a cmd_ prefix
    def self.cmd_new
      validations = DMap::Validations.list
      associations = DMap::Associations.list
      DMap::Tables.list.each do |k, table|
        properties = DMap::Properties.list[table]
        obj = $new_block.result(binding)

        if DMap::Commands.options['test'].nil? or DMap::Commands.options['test'] == false
          handler = File.new(table + ".rb", "w")
          handler.write(obj)
          handler.close
          p table.camelcase + " saved successfully"
        end

        if DMap::Commands.options['verbose'] == true
          puts obj
        end
      end
    end
  end

  # Rendering options since command-line is all string
  class Render
    def self.run(command, value)
      value = Hash[value.class.name, value] unless value.is_a?(Hash)
      if command.match(/^:/).nil?
        command = ':' + command
      end

      value.each do |key, val|
        next if val.nil?
        temp = val.to_s.split(' ')
        match = val.match(/^\[(.*?)\]$/) if val.is_a? String
        if temp.length > 1 and match.class.name != "MatchData"
          val = '"' + temp.join(' ').strip + '"'
        end

        if val.class.name == "Array"
          val.flatten!
          val = '[' + val.join(', ').to_s + ']'
        end

        next if val.nil?
        case command
          when ":within"
            temp = val.split('..')
            [':' + command, Range.new(temp[0], temp[1])]
          else
            [command.to_s, val]
        end
      end
    end
  end

  class Helpers
    def self.run(command)
      return command unless command.is_a? String

      case command.downcase
        when "time.now"
          "proc => { Time.now }"
        when "datetime.now"
          "proc => { DateTime.now }"
        else
          command
      end
    end
  end

  class Fields
    attr_accessor :list

    def self.list
      @list ||= OrderedHash.new_by
    end

    def self.add(field, property=nil)
      list.push field, property unless property.nil?
    end
  end

  class Tables
    attr_accessor :list

    def inheritance(value=nil)
      list.push value unless value.nil?
    end
    
    def self.list
      @list ||= OrderedHash.new_by
    end

    def self.add(key, value=nil)
      #list[key] = {} if list[key].nil?
      list.push key, value unless value.nil?
    end
  end
end