require 'sinatra/base'
require File.expand_path('../../lib/lti_template_builder', __FILE__)

class Server < Sinatra::Base

  get '/' do
    "rails plugin new my_lti_app -T --mountable --dummy-path=spec/test_app -m http://localhost:9292/template"
  end

  get '/template' do
    content_type :text
    builder = LtiTemplateBuilder::Builder.new
    builder.add :bootstrap_sass
    builder.add :cors_support
    builder.add :rspec
    builder.add :lti_extension, { enabled_extensions: [:editor_button, :resource_selection] }
    builder.to_s
  end

end
