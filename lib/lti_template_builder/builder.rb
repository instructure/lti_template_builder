module LtiTemplateBuilder
  class Builder
    attr_accessor :recipes, :gem_dependencies, :gem_dev_dependencies, :after_bundle_commands

    def initialize
      @gem_dependencies = []
      @gem_dev_dependencies = []
      @after_bundle_commands = []
      @recipes = []
    end

    def self.recipes
      recipe_list = {}
      Recipe.descendants.each do |descendant|
        recipe_name = Recipe.declassify(descendant.to_s).to_sym
        next if recipe_name == :gems
        recipe_list[recipe_name] = descendant.description
      end
      recipe_list
    end

    def add_gem_recipe
      recipe = LtiTemplateBuilder::Gems.new
      recipe.setup({
        gem_dependencies: @gem_dependencies.uniq,
        gem_dev_dependencies: @gem_dev_dependencies.uniq,
        after_bundle_commands: @after_bundle_commands.uniq
      })
      @recipes.unshift({ name: :gems, recipe: recipe.render })
    end

    def add(name, args={})
      klass_name = "LtiTemplateBuilder::#{name.to_s.classify}"
      recipe_klass = klass_name.constantize
      recipe = recipe_klass.new
      recipe.setup(args)
      recipe.gem_dependencies.each { |dep| @gem_dependencies << dep }
      recipe.gem_dev_dependencies.each { |dep| @gem_dev_dependencies << dep }
      recipe.after_bundle_commands.each { |cmd| @after_bundle_commands << cmd }
      @recipes << { name: name.to_sym, recipe: recipe.render }
    end

    def to_script
      add_gem_recipe
      ret = []
      @recipes.each do |item|
        ret << "\n# ---------------------------- Recipe: #{item[:name]} ---------------------------\n\n"
        ret << item[:recipe]
      end
      ret.join("\n\n")
    end

    def render_to_screen
      puts self.to_script
    end

    def save_to_file(path)
      File.open(path, "w") { |file| file.write(self.to_script) }
    end
  end
end
