# typed: false
require "cc_engine/location/position"
require "cc_engine/position/grid"
require "cc_engine/position/offset"

module CCEngine
  module Location
    RSpec.describe Position do
      describe "#to_hash" do
        it "handles positions with line and row coordinates" do
          location = Position.new(
            path: "path/to/file.css",
            start_position: CCEngine::Position::Grid.new(line: 3, column: 10),
            end_position: CCEngine::Position::Grid.new(line: 4, column: 11)
          )

          result = location.to_hash

          expect(result).to eq(
            path: "path/to/file.css",
            positions: {
              begin: {
                line: 3,
                column: 10
              },
              end: {
                line: 4,
                column: 11
              }
            }
          )
        end

        it "handles positions with absolute character offsets" do
          location = Position.new(
            path: "path/to/file.css",
            start_position: CCEngine::Position::Offset.new(offset: 3),
            end_position: CCEngine::Position::Offset.new(offset: 4)
          )

          result = location.to_hash

          expect(result).to eq(
            path: "path/to/file.css",
            positions: {
              begin: {
                offset: 3
              },
              end: {
                offset: 4
              }
            }
          )
        end
      end
    end
  end
end
