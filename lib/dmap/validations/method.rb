module DMap
  module Validations
    class WithMethod
      def self.parent_name
        "WithMethod"
      end

      def self.validate(command=nil)
        {:method => command.to_sym}
      end
    end
    class Method < WithMethod; end
  end
end