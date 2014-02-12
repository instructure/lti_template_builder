module LtiTemplateBuilder
  class Rspec < Recipe
    def self.description
      "Add rspec-rails gem along with capybara and poltergeist for testing"
    end

    def setup(args={})
      @gem_dev_dependencies << ["rspec-rails"]
      @gem_dev_dependencies << ["capybara"]
      @gem_dev_dependencies << ["poltergeist"]
      @after_bundle_commands << "generate 'rspec:install'"
      @after_bundle_commands << template("add_rspec_to_engine_config")
      @after_bundle_commands << "generate 'controller test backdoor'"
    end
  end
end
