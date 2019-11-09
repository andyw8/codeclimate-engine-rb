# typed: true
require "json"

module CCEngine
  class Issue

    def initialize(
      check_name:,
      description:,
      categories:,
      location:,
      remediation_points:,
      content:,
      fingerprint:
    )
      @check_name = check_name
      @description = description
      @categories = categories
      @location = location
      @remediation_points = remediation_points
      @content = content
      @fingerprint = fingerprint
    end

    def render
      to_hash.to_json + "\0"
    end

    def to_json
      to_hash.to_json
    end

    def to_hash
      {
        type: "issue",
        check_name: check_name,
        description: description,
        categories: categories,
        location: location.to_hash
      }.merge(remediation_points_hash).merge(content_hash).merge(fingerprint_hash)
    end

    private

    def remediation_points_hash
      return {} unless remediation_points

      {
        remediation_points: remediation_points
      }
    end

    def content_hash
      return {} unless content

      {
        content: {
          body: content
        }
      }
    end

    def fingerprint_hash
      return {} unless fingerprint

      {
        fingerprint: fingerprint
      }
    end

    private

    attr_reader :check_name,
      :description,
      :categories,
      :location,
      :remediation_points,
      :content,
      :fingerprint,
      :check_name,
      :description,
      :categories,
      :location,
      :remediation_points,
      :content,
      :fingerprint
  end
end
