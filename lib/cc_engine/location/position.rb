module CCEngine
  module Location
    class Position
      def initialize(path:, start_position:, end_position:)
        @path = path
        @start_position = start_position
        @end_position = end_position
      end

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

      attr_reader :path, :start_position, :end_position
    end
  end
end
