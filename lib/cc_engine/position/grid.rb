# typed: strict
module CCEngine
  module Position
    class Grid
      extend T::Sig

      sig {params(line: Integer, column: Integer).void}
      def initialize(line:, column:)
        @line = line
        @column = column
      end

      sig {returns(T::Hash[Symbol, T.untyped])}
      def to_hash
        {
          line: line,
          column: column
        }
      end

      sig {returns(Integer)}
      attr_reader :line

      sig {returns(Integer)}
      attr_reader :column
    end
  end
end
