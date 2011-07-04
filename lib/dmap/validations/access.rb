module DMap
  module Validations
    class Accessor
      attr_accessor :property

      def self.property; true; end;

      # for aliases
      def self.parent_name
        "Accessor"
      end

      # Return true if it's valid
      def self.is_valid?(command)
        (command == "protected" or command == "public" or command == "private")
      end

      # This is what's returned to our template
      def self.validate(command=nil)
        command ||= "protected"
        ":" + command
      end
    end

    # aliases
    class Access < Accessor; end

    class Writer
      attr_accessor :property

      def self.property; true; end;

      def self.is_valid?(command)
        (command == "protected" or command == "public" or command == "private")
      end

      def self.validate(command=nil)
        command ||= "protected"
        ":" + command
      end
    end

    class Reader
      attr_accessor :property

      def self.property; true; end;

      def self.is_valid?(command)
        (command == "protected" or command == "public" or command == "private")
      end

      def self.validate(command=nil)
        command ||= "protected"
        ":" + command
      end
    end
  end
end