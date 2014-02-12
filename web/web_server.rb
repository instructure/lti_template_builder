require 'sinatra/base'
require File.expand_path('../../lib/lti_template_builder', __FILE__)

class WebServer < Sinatra::Base

  get '/' do
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    erb :index
  end

  get '/template/' do
    content_type :text
    extensions = params[:ext].split(',').map(&:to_sym)
    builder = LtiTemplateBuilder::Builder.new
    builder.add :bootstrap_sass
    builder.add :cors_support
    builder.add :rspec
    builder.add :lti_extension, { enabled_extensions: extensions }
    builder.add :extra
    builder.to_script
  end

end
