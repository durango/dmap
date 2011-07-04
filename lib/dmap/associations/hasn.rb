module DMap
  module Associations
    class HasN
      attr_accessor :associations

      def self.associations; true; end

      def self.parent_name
        "HasN"
      end

      def self.field
        "has n, "
      end

      def self.is_valid?(command=nil)
        (!command.nil? or command)
      end

      def self.validate(command=nil)
        command = command.split('-')
        command[1] = nil if command[1].nil?
        command[1] = command[1].to_sym unless command[1].nil? or command[1] == "true" or command[1] == "false"
        {:fields => command[0].underscore.to_sym, :through => command[1].to_sym}
      end
    end
    class Hasn < HasN; end;

    class HasMany
      attr_accessor :associations

      def self.associations; true; end

      def self.parent_name
        "HasMany"
      end

      def self.field
        "has n, "
      end

      def self.is_valid?(command=nil)
        (!command.nil? or command)
      end

      def self.validate(command=nil)
        command = command.split('-')
        command[1] = nil if command[1].nil?
        {:fields => command[0].underscore.to_sym, :through => command[1]}
      end
    end
    class Hasmany < HasMany; end;

    class Has1
      attr_accessor :associations

      def self.associations; true; end

      def self.field
        "has 1, "
      end

      def self.parent_name
        "Has1"
      end

      def self.is_valid?(command=nil)
        (!command.nil? or command or command.is_a? Symbol)
      end

      def self.validate(command=nil)
        command = command.split('-')
        command[1] = nil if command[1].nil?
        {:fields => command[0].underscore.to_sym, :through => command[1].to_sym}
      end
    end
    class Hasone < Has1; end;
  end
end