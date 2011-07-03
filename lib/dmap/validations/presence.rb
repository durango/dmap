module DMap
  module Validations
    class PresenceOf
      def self.parent_name
        "PresenceOf"
      end

      def self.validate(command=nil)
        ret = DMap::Validations::Core::Numbers.run command
        ret1 = DMap::Validations::Core::When.run ret[:cmd]
        ret.merge!(ret1)
      end
    end
    class Present < PresenceOf; end
  end
end