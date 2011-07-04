module DMap
  module Associations
    class BelongsTo
      attr_accessor :associations

      def self.associations; true; end

      def self.field
        "belongs_to "
      end

      def self.parent_name
        "BelongsTo"
      end

      def self.is_valid?(command=nil)
        true
      end

      def self.validate(command=nil)
        command = command.split('-')
        command[1] = nil if command[1].nil?
        command[1] = command[1].to_sym unless command[1].nil? or command[1] == "true" or command[1] == "false"
        {:fields => command[0].underscore.to_sym, :key => command[1]}
      end
    end
    class Belongs < BelongsTo; end;
  end
end