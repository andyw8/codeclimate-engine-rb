require "cc_engine/location/line_range"

module CCEngine
  module Location
    RSpec.describe LineRange do
      describe "#to_hash" do
        it "handles simple line numbers" do
          location = LineRange.new(
            path: "path/to/file.css", line_range: 13..14
          )

          result = location.to_hash

          expect(result).to eq(
            path: "path/to/file.css",
            lines: {
              begin: 13,
              end: 14
            }
          )
        end
      end
    end
  end
end
