module LtiTemplateBuilder
  class BootstrapSass < Recipe
    def setup(args={})
      @gem_dependencies << ["sass-rails", ">= 3.2"]
      @gem_dependencies << ["bootstrap-sass", "~> 3.1.0"]
    end
  end
end
