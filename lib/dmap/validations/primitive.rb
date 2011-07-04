module DMap
  module Validations
    class PrimitiveTypeOf
      def self.parent_name
        "PrimitiveTypeOf"
      end

      def self.is_valid?(command=nil)
        true # always
      end

      def self.validate(command=nil)
        {:null => true}
      end
    end
    class PrimitiveType < PrimitiveTypeOf; end
    class PrimitiveOf < PrimitiveTypeOf; end
    class Primitive < PrimitiveTypeOf; end
  end
end