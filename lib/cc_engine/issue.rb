# typed: strict
require "json"

module CCEngine
  class Issue
    extend T::Sig

    sig {
      params(
        check_name: String,
        description: String,
        categories: T::Array[String],
        location: T.any(CCEngine::Location::LineRange, CCEngine::Location::Position),
        remediation_points: T.nilable(Integer),
        content: T.nilable(String),
        fingerprint: T.nilable(String)
      ).void
    }
    def initialize(
      check_name:,
      description:,
      categories:,
      location:,
      remediation_points:,
      content:,
      fingerprint:
    )
      @check_name = T.let(check_name, String)
      @description = T.let(description, String)
      @categories = T.let(categories, T::Array[String])
      @location = T.let(location, T.any(CCEngine::Location::LineRange, CCEngine::Location::Position))
      @remediation_points = T.let(remediation_points, T.nilable(Integer))
      @content = T.let(content, T.nilable(String))
      @fingerprint = T.let(fingerprint, T.nilable(String))
    end

    sig {returns(String)}
    def render
      to_hash.to_json + "\0"
    end

    sig {returns(String)}
    def to_json
      to_hash.to_json
    end

    sig {returns(T::Hash[Symbol, T.untyped])}
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

    sig {returns(T::Hash[Symbol, T.untyped])}
    def remediation_points_hash
      return {} unless remediation_points

      {
        remediation_points: remediation_points
      }
    end

    sig {returns(T::Hash[Symbol, T.untyped])}
    def content_hash
      return {} unless content

      {
        content: {
          body: content
        }
      }
    end

    sig {returns(T::Hash[Symbol, T.untyped])}
    def fingerprint_hash
      return {} unless fingerprint

      {
        fingerprint: fingerprint
      }
    end

    sig { returns(String) }
    attr_reader :check_name

    sig { returns(String) }
    attr_reader :description

    sig { returns(T::Array[String]) }
    attr_reader :categories

    sig { returns(T.any(CCEngine::Location::LineRange, CCEngine::Location::Position)) }
    attr_reader :location

    sig { returns(T.nilable(Integer)) }
    attr_reader :remediation_points

    sig { returns(T.nilable(String)) }
    attr_reader :content

    sig { returns(T.nilable(String)) }
    attr_reader :fingerprint
  end
end
