module Fakeit
  module Openapi
    module Example
      BIG_INT = 2**32

      def integer_example
        if enum
          enum.to_a.sample
        else
          Faker::Number.between(int_rand_begin, int_rand_end) * int_multiple
        end
      end

      private

      def int_rand_begin
        min_int / int_multiple + int_rand_begin_adjust
      end

      def int_rand_end
        max_int / int_multiple
      end

      def int_rand_begin_adjust
        (min_int % int_multiple).zero? ? 0 : 1
      end

      def int_multiple
        multipleOf || 1
      end

      def min_int
        if minimum
          exclusiveMinimum ? minimum + 1 : minimum
        else
          1
        end
      end

      def max_int
        if maximum
          exclusiveMaximum ? maximum - 1 : maximum
        else
          BIG_INT
        end
      end
    end
  end
end
