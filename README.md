# LTI Template Builder

[![Build Status](https://travis-ci.org/instructure/lti_template_builder.png?branch=master)](https://travis-ci.org/instructure/lti_template_builder)
[![Code Climate](https://codeclimate.com/github/instructure/lti_template_builder.png)](https://codeclimate.com/github/instructure/lti_template_builder)
[![Gem Version](https://badge.fury.io/rb/lti_template_builder.png)](http://badge.fury.io/rb/lti_template_builder)

Template generator for building LTI apps quickly on top of Rails
mountable engines.

## Installation

Add this line to your application's Gemfile:

    gem 'lti_template_builder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lti_template_builder

## Usage

To build a Rails template, you need to instanciate the builder and then
add recipes to it.

Example:

```ruby
require 'lti_template_builder'
builder = LtiTemplateBuilder::Builder.new

# Add recipes
builder.add :bootstrap_sass
builder.add :cors_support
builder.add :rspec
builder.add :lti_extension, { enabled_extensions: [:editor_button, :resource_selection] }
builder.add :extra

# Print out the generated template.rb
puts builder.to_script

# Write builder to file
builder.save_to_file("path/to/template.rb")
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/lti_template_builder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
