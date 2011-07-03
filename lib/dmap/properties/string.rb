module DMap
  module Properties
    class String
      def self.default(value)
        true
      end
      
      def self.parent_name
        "String"
      end
    end
    class Str < String; end
    class S < String; end

    class Text
      def self.parent_name
        "Text"
      end
    end
    class Txt < Text; end
  end
end