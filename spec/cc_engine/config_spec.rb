require "cc_engine/config"

RSpec.describe CCEngine::Config do
  describe "#include_paths" do
    it "returns an array of paths to be included" do
      config = CCEngine::Config.new(
        '{"include_paths":["foo/bar.txt", "foo/baz.txt"]}'
      )

      result = config.include_paths

      expect(result).to eq(["foo/bar.txt", "foo/baz.txt"])
    end
  end

  describe "#exclude_paths" do
    it "returns an array of paths to be excluded" do
      config = CCEngine::Config.new(
        '{"exclude_paths":["foo/bar.txt", "foo/baz.txt"]}'
      )

      result = config.exclude_paths

      expect(result).to eq(["foo/bar.txt", "foo/baz.txt"])
    end
  end

  describe "#enabled?" do
    it "returns true if the engine is enabled" do
      config = CCEngine::Config.new('{"enabled":true}')

      result = config.enabled?

      expect(result).to be(true)
    end

    it "returns false if the engine is not enabled" do
      config = CCEngine::Config.new('{"enabled":false}')

      result = config.enabled?

      expect(result).to be(false)
    end
  end
end
