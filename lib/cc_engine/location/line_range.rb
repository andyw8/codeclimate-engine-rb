# typed: true
module CCEngine
  module Location
    class LineRange
      def initialize(path:, line_range:)
        @path = path
        @line_range = line_range
      end

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

      attr_reader :path, :line_range
    end
  end
end
