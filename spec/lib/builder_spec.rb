require 'spec_helper'

module LtiTemplateBuilder
  describe Builder do
    it "should build a template" do
      builder = Builder.new

      builder.add :cors_support
      builder.add :rspec
      builder.add :lti_extension, { enabled_extensions: [:editor_button, :resource_selection] }

      builder.render_to_screen

      builder.gem_dependencies.count.should eq(1)
      builder.gem_dev_dependencies.count.should eq(3)
    end

    it "should return a list of available recipes" do
      recipes = Builder.recipes
      puts recipes.inspect
      recipes.length.should eq(5)
    end
  end
end
