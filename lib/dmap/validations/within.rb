module DMap
  module Validations
    class Within
      def self.parent_name
        "Within"
      end

      def self.validate(command=nil)
        ret = DMap::Validations::Core::Numbers.run command
        ret1 = DMap::Validations::Core::Fields.run command
        ret.merge!(ret1)
      end
    end
  end
end