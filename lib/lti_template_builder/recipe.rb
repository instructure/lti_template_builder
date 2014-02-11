require 'erb'

module LtiTemplateBuilder
  class Recipe
    attr_accessor :gem_dependencies, :gem_dev_dependencies, :after_bundle_commands

    def initialize
      @gem_dependencies = []
      @gem_dev_dependencies = []
      @after_bundle_commands = []
    end

    def setup(args={})
      raise "Please override this method!!!"
    end

    def template(template_name)
      erb = ERB.new(File.read(File.expand_path("../recipes/#{recipe_name}/#{template_name}.erb", __FILE__)))
      erb.result(self.instance_eval { binding })
    end

    def render
      puts "CLASS: #{self.class.name}"
      erb = ERB.new(File.read(File.expand_path("../recipes/#{recipe_name}/template.erb", __FILE__)))
      erb.result(self.instance_eval { binding })
    end

    protected

    def recipe_name
      class_name = self.class.name
      class_name.split("::").last.underscore
    end

  end
end
