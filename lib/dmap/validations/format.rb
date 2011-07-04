module DMap
  module Validations
    class FormatOf
      def self.parent_name
        "FormatOf"
      end

      def self.is_valid?(command=nil)
        # To many different values to really pin-point
        true
      end

      def self.validate(command=nil)
        command = command.to_sym if command.match(/^[A-Za-z]/)
        {:as => command}
      end
    end
    class Format < FormatOf; end
  end
end