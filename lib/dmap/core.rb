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

#DMap Core functions + Table and Fields
module DMap
  # List available commands here
  class Commands
    def self.exists?(command)
      list = %w[ new ].include? command
    end
  end

  class Fields
    attr_accessor :list
    
    def self.list
      @list ||= Hash[]
    end

    def self.add(field, property=nil)
      list.store field, property unless property.nil?
    end
  end

  class Tables
    attr_accessor :list

    def inheritance(value=nil)
      list.push value unless value.nil?
    end
    
    def self.list
      @list ||= Hash[]
    end

    def self.add(key, value=nil)
      list[key] = {} if list[key].nil?
      list.store key, value unless value.nil?
    end
  end
end