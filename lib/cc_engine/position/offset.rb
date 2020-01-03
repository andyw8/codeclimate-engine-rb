# typed: strict

module CCEngine
  module Position
    class Offset
      extend T::Sig
      sig {params(offset: Integer).void}
      def initialize(offset:)
        @offset = offset
      end

      sig {returns(T::Hash[Symbol, T.untyped])}
      def to_hash
        {
          offset: offset
        }
      end

      private

      sig { returns(Integer) }
      attr_reader :offset
    end
  end
end
