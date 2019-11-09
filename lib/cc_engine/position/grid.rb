module CCEngine
  module Position
    class Grid
      def initialize(line:, column:)
        @line = line
        @column = column
      end

      def to_hash
        {
          line: line,
          column: column
        }
      end

      attr_reader :line, :column
    end
  end
end
