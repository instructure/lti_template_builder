require "active_support/inflector"

require "lti_template_builder/builder"
require "lti_template_builder/recipe"

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/lti_template_builder/recipes/**/*.rb') {|file| require file}

require "lti_template_builder/version"

require 'pry-debugger'

module LtiTemplateBuilder
  # Your code goes here...
end
