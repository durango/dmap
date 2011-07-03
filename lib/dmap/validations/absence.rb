module DMap
  module Validations
    class AbsenceOf
      def self.parent_name
        "AbsenceOf"
      end

      def self.validate(command=nil)
        {:null => true}
      end
    end
    class Absence < AbsenceOf; end
    class Absent < AbsenceOf; end
  end
end