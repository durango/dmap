module DMap
  module Associations
    attr_accessor :list

    class << self
      def list
        @list ||= OrderedHash.auto
      end

      # validates_*_of
      def add(field, validation, bucket, value)
        list[field][validation].store bucket, value unless value.nil?
      end
    end

    module Core
      module When
        def self.run(validation)
          { :when => validation.split('-').map { |x| ':' + x } }
        end
      end

      module Fields
        def self.run(validation)
          { :fields => validation.split('-') }
        end
      end
    end
  end
end