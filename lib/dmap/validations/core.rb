module DMap
  module Validations
    attr_accessor :list, :default

    class << self
      def list
        @list ||= Hash[]
      end

      # validates_*_of
      def add(field, validation, bucket, value)
        list[field] = {} if list[field].nil?
        list[field][validation] = {} if list[field][validation].nil?
        list[field][validation][bucket] = {} if list[field][validation][bucket].nil?
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

      module Numbers
        def self.run(valid)
          validation = valid
          # Let's get the minimum/maximum numbers e.g. 20min50max
          minimum = validation[/(\d+)min/, 1] # fetch min
          unless minimum.nil? # take it out
            validation.sub!(/\d+min/i, '')
          end

          maximum = validation[/(\d+)max/, 1]
          unless maximum.nil? # take it out
            validation.sub!(/\d+max/i, '')
          end

          # Now for the min..max e.g. 20..50
          within = validation[/(\d+\.\.\d+)/, 1] unless minimum or maximum
          validation.sub!(/\d+\.\.\d+/, '')

          # Just equals? e.g. length_of=5
          equals = validation[/^(\d+)$/, 1] unless minimum or maximum
          validation.sub!(/^\d+$/, '')

          Hash[:cmd => validation, :min => minimum, :max => maximum, :within => within, :equals => equals]
        end
      end
    end
  end
end