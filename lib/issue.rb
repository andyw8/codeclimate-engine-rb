require "virtus"
require "location"

class Issue
  include Virtus.model(strict: true)

  attribute :check_name, String
  attribute :description, String
  attribute :categories, Array[String]
  attribute :location, Location
  attribute :remediation_points, Integer

  def to_hash
    {
      type: "issue",
      check_name: check_name,
      description: description,
      categories: categories,
      location: location.to_hash,
      remediation_points: remediation_points
    }
  end

end
