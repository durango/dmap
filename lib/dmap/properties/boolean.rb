module DMap
  module Properties
    class Boolean
      def self.default(value)
        value.to_bool.is_a?(Boolean)
      end

      def self.parent_name
        "Boolean"
      end
    end
    class Bool < Boolean; end
  end
end