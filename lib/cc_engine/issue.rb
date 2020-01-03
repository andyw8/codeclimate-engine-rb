# typed: strict
require "json"

module CCEngine
  class Issue < T::Struct
    extend T::Sig

    prop :check_name, String
    prop :description, String
    prop :categories, T::Array[String]
    prop :location, T.any(CCEngine::Location::LineRange, CCEngine::Location::Position)
    prop :remediation_points, T.nilable(Integer)
    prop :content, T.nilable(String)
    prop :fingerprint, T.nilable(String)

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
  end
end
