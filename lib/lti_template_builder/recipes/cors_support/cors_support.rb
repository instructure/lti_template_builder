module LtiTemplateBuilder
  class CorsSupport < Recipe
    def self.description
      "Allow for CORS requests to be accepted. This is mandatory for LTI applications."
    end

    def setup(args={})
    end
  end
end
