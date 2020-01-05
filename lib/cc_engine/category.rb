# typed: strict
module CCEngine
  module Category
    extend T::Sig

    sig {returns(String)}
    def self.bug_risk
      "Bug Risk"
    end

    sig {returns(String)}
    def self.clarity
      "Clarity"
    end

    sig {returns(String)}
    def self.compatibility
      "Compatibility"
    end

    sig {returns(String)}
    def self.complexity
      "Complexity"
    end

    sig {returns(String)}
    def self.duplication
      "Duplication"
    end

    sig {returns(String)}
    def self.security
      "Security"
    end

    sig {returns(String)}
    def self.style
      "Style"
    end
  end
end
