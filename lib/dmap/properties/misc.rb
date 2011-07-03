module DMap
  module Properties
    class Object
      def self.parent_name
        "Object"
      end
    end
    class Obj < Object; end

    class Discriminator
      def self.parent_name
        "Discriminator"
      end
    end
    class Disc < Discriminator; end

    class Binary
      def self.parent_name
        "Binary"
      end
    end
    class Blob < Binary; end
    class B < Binary; end
  end
end