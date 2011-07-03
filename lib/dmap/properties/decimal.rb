module Dmap
  module Properties
    class Float
      def self.parent_name
        "Float"
      end
    end
    class F < Float; end

    class Decimal
      def self.parent_name
        "Decimal"
      end
    end
    class Dec < Decimal; end
  end
end