# typed: false
require "cc_engine/issue"
require "cc_engine/category"

module CCEngine
  RSpec.describe Issue do
    describe "#to_hash" do
      it "sets the type to 'issue'" do
        issue = build_issue

        result = issue.to_hash

        expect(result).to include(
          type: "issue"
        )
      end

      it "uses the given check name" do
        issue = build_issue(check_name: "Bug Risk/Unused Variable")

        result = issue.to_hash

        expect(result).to include(
          check_name: "Bug Risk/Unused Variable"
        )
      end

      it "uses the given description" do
        issue = build_issue(description: "Unused local variable `foo`")

        result = issue.to_hash

        expect(result).to include(
          description: "Unused local variable `foo`"
        )
      end

      it "uses the given categories" do
        issue = build_issue(categories: [Category.complexity, Category.style])

        result = issue.to_hash

        expect(result).to include(
          categories: %w(Complexity Style)
        )
      end

      it "accepts a location" do
        location = double(:location, to_hash: { foo: "bar" })
        issue = build_issue(location: location)

        result = issue.to_hash

        expect(result).to include(
          location: {
            foo: "bar"
          }
        )
      end

      it "uses the given remediation points" do
        issue = build_issue(remediation_points: 7)

        result = issue.to_hash

        expect(result).to include(
          remediation_points: 7
        )
      end

      it "does not include remediation points if not set" do
        issue = build_issue

        result = issue.to_hash

        expect(result).to_not have_key(:remediation_points)
      end

      it "uses the given content" do
        issue = build_issue(content: "my content")

        result = issue.to_hash

        expect(result).to include(
          content: {
            body: "my content"
          }
        )
      end

      it "does not include content if not set" do
        issue = build_issue

        result = issue.to_hash

        expect(result).to_not have_key(:content)
      end

      it "includes a fingerprint if set" do
        issue = build_issue(fingerprint: "abc123")

        result = issue.to_hash

        expect(result).to include(
          fingerprint: "abc123"
        )
      end

      it "does not include fingerprint if not set" do
        issue = build_issue

        result = issue.to_hash

        expect(result).to_not have_key(:fingerprint)
      end
    end

    describe "#render" do
      it "renders the issue as JSON, followed by a null character" do
        issue = build_issue

        result = issue.render

        expect(result).to end_with("\0")
      end
    end

    # rubocop:disable Metrics/MethodLength
    def build_issue(
      check_name: "",
      description: "",
      categories: [],
      location: build_location,
      remediation_points: nil,
      content: nil,
      fingerprint: nil
    )
      Issue.new(
        check_name: check_name,
        description: description,
        categories: categories,
        location: location,
        remediation_points: remediation_points,
        content: content,
        fingerprint: fingerprint
      )
    end
    # rubocop:enable Metrics/MethodLength

    def build_location
      double(:location, to_hash: { foo: "bar" })
    end
  end
end
