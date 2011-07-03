module DMap
  module Properties
    class Date
      def self.parent_name
        "Date"
      end
    end
    class D < Date; end

    class DateTime
      def self.default(value=nil)
        true
      end

      def self.parent_name
        "DateTime"
      end
    end
    class Datetime < DateTime; end
    class Dt < DateTime; end

    class Time
      def self.parent_name
        "Time"
      end
    end
    class T < Time; end
  end
end