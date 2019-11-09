module CCEngine
  module Position
    class Offset
      def initialize(offset:)
        @offset = offset
      end

      def to_hash
        {
          offset: offset
        }
      end

      private

      attr_reader :offset
    end
  end
end
