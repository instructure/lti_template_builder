module LtiTemplateBuilder
  class Gems < Recipe
    def setup(args={})
      @gem_dependencies = args[:gem_dependencies]
      @gem_dev_dependencies = args[:gem_dev_dependencies]
      @after_bundle_commands = args[:after_bundle_commands]
    end
  end
end
