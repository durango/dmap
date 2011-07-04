module DMap
  module Validations
    # Only need the property tag when the validation attaches itself to the property
    class Length
      attr_accessor :property

      def self.property; true; end

      # Return true if it's valid
      def self.is_valid?(command=nil)
        command ||= ""
        !(command.match(/^\d+$/) or command.match(/^\d+\.\.\d+$/)).nil?
      end

      def self.validate(command=nil)
        command ||= ""
        DMap::Validations::Core::Numbers.run command
      end
    end

    class LengthOf
      attr_accessor :ret

      # for aliases
      def self.parent_name
        "LengthOf"
      end

      def self.ret
        @ret
      end

      # Return true if it's valid
      def self.is_valid?(command)
        @ret = DMap::Validations::Core::Numbers.run command
        !(ret[:min].nil? and ret[:max].nil? and ret[:within].nil? and ret[:equals].nil?)
      end

      def self.validate(command=nil)
        @ret ||= DMap::Validations::Core::Numbers.run command
      end
    end
  end
end