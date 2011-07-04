module DMap
  module Properties
    attr_accessor :list
    class << self
      # default methods
      def default
      end

      def valid?(klass)
        begin
          self.const_get(klass.capitalize).is_a? Class
        rescue
          false
        end
      end

      def list
        @list ||= OrderedHash.auto
      end

      def add(table, property=nil, value=nil, bucket=nil)
        unless property.nil?
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