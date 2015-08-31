require "cc_engine/position/offset"

module CCEngine
  module Position
    RSpec.describe Offset do
      it "uses the given offset" do
        offset_position = Offset.new(offset: 4)

        result = offset_position.to_hash

        expect(result).to eq(offset: 4)
      end
    end
  end
end
