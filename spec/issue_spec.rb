require "issue"
require "category"

RSpec.describe Issue do
  describe "#to_hash" do
    specify do
      location = Location.new(
        path: "path/to/file.css",
        line_range: 13..14
      )
      issue = Issue.new(
        check_name: "Bug Risk/Unused Variable",
        description: "Unused local variable `foo`",
        categories: [Category.complexity],
        location: location,
        remediation_points: 500
      )

      result = issue.to_hash

      expect(result).to eq(
        {
          type: "issue",
          check_name: "Bug Risk/Unused Variable",
          description: "Unused local variable `foo`",
          categories: ["Complexity"],
          location: {
            "path": "path/to/file.css",
            "lines": {
              "begin": 13,
              "end": 14
            }
          },
          remediation_points: 500
        }
      )
    end
  end
end
