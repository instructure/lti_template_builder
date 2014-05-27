module LtiTemplateBuilder
  class BootstrapSass < Recipe
    def self.description
      "Twitter Bootstrap sass gem"
    end

    def setup(args={})
      @gem_dependencies << ["sass-rails", "~> 4.0.3"]
      @gem_dependencies << ["bootstrap-sass", "~> 3.1.1"]
    end
  end
end
