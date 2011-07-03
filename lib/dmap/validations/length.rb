module DMap
  module Validations
    class LengthOf
      def self.parent_name
        "LengthOf"
      end

      def self.validate(command=nil)
        ret = DMap::Validations::Core::Numbers.run command
      end
    end
  end
end