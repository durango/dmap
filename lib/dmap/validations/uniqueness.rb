module DMap
  module Validations
    # Only need the property tag when the validation attaches itself to the property
    class Unique
      attr_accessor :property

      def self.property; true; end;

      def self.is_valid?(command=nil)
        true # always
      end

      def self.validate(command=nil)
        (command != "true" or command != "false")
      end
    end

    class UniquenessOf
      def self.parent_name
        "UniquenessOf"
      end

      def self.is_valid?(command=nil)
        true # always
      end

      def self.validate(command=nil)
        {:field => :self}
      end
    end
    class Uniqueness < UniquenessOf; end
  end
end