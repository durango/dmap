module DMap
  module Validations
    class Confirmation
      def self.parent_name
        "Confirmation"
      end

      def self.is_valid?(command=nil)
        if command.is_a?(String) or command.is_a?(Symbol)
          true
        else
          false
        end
      end

      def self.validate(command=nil)
        {:confirm => command.to_sym}
      end
    end
    class Confirm < Confirmation; end

    class Acceptance
      def self.parent_name
        "Acceptance"
      end

      def self.validate(command=nil)
        {:accept => command.to_s}
      end
    end
    class Accept < Acceptance; end
  end
end