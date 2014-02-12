module LtiTemplateBuilder
  class LtiExtension < Recipe
    def self.description
      "Installs all things LTI related (ims-lti gem and extensions)"
    end

    def setup(args)
      @gem_dependencies << ["ims-lti"]
      @enabled_extensions = args[:enabled_extensions] || []
      @after_bundle_commands << "generate 'controller lti index'"

      @additional_configs = []
      @additional_configs << "      tc.canvas_homework_submission!(enabled: true)" if @enabled_extensions.include? :homework_submission
      @additional_configs << "      tc.canvas_editor_button!(enabled: true)"       if @enabled_extensions.include? :editor_button
      @additional_configs << "      tc.canvas_resource_selection!(enabled: true)"  if @enabled_extensions.include? :resource_selection
      @additional_configs << "      tc.canvas_account_navigation!(enabled: true)"  if @enabled_extensions.include? :account_navigation
      @additional_configs << "      tc.canvas_course_navigation!(enabled: true)"   if @enabled_extensions.include? :course_navigation
      @additional_configs << "      tc.canvas_user_navigation!(enabled: true)"     if @enabled_extensions.include? :user_navigation

      @extra_expects = ["\n"]
      @extra_expects << "          expect(response.body).to include('<lticm:options name=\"homework_submission\">')" if @enabled_extensions.include? :homework_submission
      @extra_expects << "          expect(response.body).to include('<lticm:options name=\"editor_button\">')"       if @enabled_extensions.include? :editor_button
      @extra_expects << "          expect(response.body).to include('<lticm:options name=\"resource_selection\">')"  if @enabled_extensions.include? :resource_selection
      @extra_expects << "          expect(response.body).to include('<lticm:options name=\"account_navigation\">')"  if @enabled_extensions.include? :account_navigation
      @extra_expects << "          expect(response.body).to include('<lticm:options name=\"course_navigation\">')"   if @enabled_extensions.include? :course_navigation
      @extra_expects << "          expect(response.body).to include('<lticm:options name=\"user_navigation\">')"     if @enabled_extensions.include? :user_navigation
    end
  end
end
