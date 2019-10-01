# typed: false
require "cc_engine/position/grid"

module CCEngine
  module Position
    RSpec.describe Grid do
      it "uses the given line and column" do
        grid_position = Grid.new(line: 3, column: 10)

        result = grid_position.to_hash

        expect(result).to eq(
          line: 3,
          column: 10
        )
      end
    end
  end
end
