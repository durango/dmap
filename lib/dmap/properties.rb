module DMap
  module Properties
    attr_accessor :list
    class << self
  
      def required(value)
        value.is_a?(Boolean)
      end
  
      def valid?(klass)
        begin
          # Don't need if I need to do the sub() thing anymore...
          self.const_get(klass.capitalize.sub('Datetime', 'DateTime')).is_a?(Class)
        rescue
          false
        end
      end
  
      def list
        @list ||= Hash[]
      end
  
      def add(table, property=nil, value=nil, bucket=nil)
        list[table] = {} if list[table].nil?
        unless property.nil?
          list[table][property] = {} if list[table][property].nil?
          if bucket.nil?
            list[table].store property, value unless value.nil?
          else
            list[table][property][bucket] = value
          end
        end
      end
    end
  end
end