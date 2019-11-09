# typed: strict

module CCEngine
  module Location
    class Position
      extend T::Sig
      sig {
        params(
          path: String,
          start_position: T.any(CCEngine::Position::Offset, CCEngine::Position::Grid),
          end_position: T.any(CCEngine::Position::Offset, CCEngine::Position::Grid),
        ).void
      }
      def initialize(path:, start_position:, end_position:)
        @path = T.let(path, String)
        @start_position = T.let(start_position, T.any(CCEngine::Position::Offset, CCEngine::Position::Grid))
        @end_position = T.let(end_position, T.any(CCEngine::Position::Offset, CCEngine::Position::Grid))
      end

      sig { returns(T::Hash[Symbol, T.untyped]) }
      def to_hash
        {
          path: path,
          positions: {
            begin: start_position.to_hash,
            end: end_position.to_hash
          }
        }
      end

      private

      sig { returns(String) }
      attr_reader :path

      sig { returns(T.any(CCEngine::Position::Offset, CCEngine::Position::Grid)) }
      attr_reader :start_position

      sig { returns(T.any(CCEngine::Position::Offset, CCEngine::Position::Grid)) }
      attr_reader :end_position
    end
  end
end
