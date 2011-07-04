module DMap
  module Validations
    class Key
      attr_accessor :property

      def self.property; true; end

      def self.is_valid?(command=nil)
        command ||= "true"
        (command == "true" or command == "false")
      end

      def self.validate(command=nil)
        true
      end
    end

    class Lazy
      attr_accessor :property

      def self.property; true; end

      def self.is_valid?(command=nil)
        command ||= "true"
        (command == "true" or command == "false" or !command.match('^[\:A-Za-z_\-]+$').nil?)
      end

      def self.validate(command=nil)
        if command == "true" or command == "false"
          command
        else
          DMap::Validations::Core::When.run(command)
        end
      end
    end

    class Default
      attr_accessor :property

      def self.property; true; end;

      def self.parent_name
        "Default"
      end

      def self.is_valid?(command=nil)
        true
      end

      def self.validate(command=nil)
        command ||= "true"
      end
    end
    class Def < Default; end;

    class Required
      attr_accessor :property

      def self.property; true; end;

      def self.parent_name
        "Required"
      end

      def self.is_valid?(command)
        command ||= "true"
        (command == "true" or command == "false")
      end

      def self.validate(command)
        command ||= "true"
      end
    end
    class Req < Required; end;
  end
end