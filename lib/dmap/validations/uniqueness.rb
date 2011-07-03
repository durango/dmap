module DMap
  module Validations
    class UniquenessOf
      def self.parent_name
        "UniquenessOf"
      end

      def self.validate(command=nil)
        {:field => :self}
      end
    end
    class Uniqueness < UniquenessOf; end
  end
end