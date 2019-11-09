# typed: strict
require "json"

module CCEngine
  class Config
    extend T::Sig

    sig { params(json_string: String).void }
    def initialize(json_string)
      @json_string = T.let(json_string, String)
      @parsed_json = T.let(nil, T.nilable(T::Hash[String, T.untyped]))
    end

    sig { returns(T::Array[String]) }
    def include_paths
      parsed_json.fetch("include_paths")
    end

    sig { returns(T::Array[String]) }
    def exclude_paths
      parsed_json.fetch("exclude_paths")
    end

    sig { returns(T::Boolean) }
    def enabled?
      parsed_json.fetch("enabled")
    end

    protected

    sig { returns(String) }
    attr_reader :json_string

    private

    sig {returns(T::Hash[String, T.untyped])}
    def parsed_json
      @parsed_json ||= JSON.parse(json_string)
    end
  end
end
