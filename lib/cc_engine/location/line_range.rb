# typed: strict

module CCEngine
  module Location
    class LineRange
      extend T::Sig

      sig {
        params(
          path: String,
          line_range: T::Range[Integer],
        ).void
      }
      def initialize(path:, line_range:)
        @path = path
        @line_range = line_range
      end

      sig { returns(T::Hash[Symbol, T.untyped]) }
      def to_hash
        {
          path: path,
          lines: {
            begin: line_range.begin,
            end: line_range.end
          }
        }
      end

      private

      sig { returns(String) }
      attr_reader :path

      sig { returns(T::Range[Integer]) }
      attr_reader :line_range
    end
  end
end
