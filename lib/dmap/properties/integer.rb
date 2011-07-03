module DMap
  module Properties
    class Integer
      def length(value)
        false unless (value.is_a(Fixnum) || value.is_a(Integer))
      end

      def self.parent_name
        "Integer"
      end
    end
    class Int < Integer; end
    class I < Integer; end
  end
end