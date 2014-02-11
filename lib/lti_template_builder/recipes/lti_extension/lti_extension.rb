module LtiTemplateBuilder
  class LtiExtension < Recipe
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
    end
  end
end
