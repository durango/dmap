module DMap
  module Validations
    class AbsenceOf
      # for aliases
      def self.parent_name
        "AbsenceOf"
      end

      # Return true if it's valid
      def self.is_valid?(command)
        true
      end

      # This is what's returned to our template
      def self.validate(command=nil)
        {:null => true}
      end
    end

    # aliases
    class Absence < AbsenceOf; end
    class Absent < AbsenceOf; end
  end
end