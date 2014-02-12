App = Ember.Application.create();

App.Router.map(function() {
  this.route('index', { path: '/' });
});

App.LtiExtension = Ember.Object.extend({});

App.IndexController = Ember.ArrayController.extend({
  appName: 'my_lti_app',

  buildUrl: function() {
    var extNames = this.get('selectedExtensions').mapBy('optName');
    var host = Ember.ENV.host;
    return host + "/template/?ext=" + extNames;
  }.property('selectedExtensions', 'appName'),

  installCommand: function() {
    return "rails plugin new " + this.get('appName') + " -T \\\n\
    --mountable \\\n\
    --dummy-path=spec/test_app \\\n\
    -m " + this.get('buildUrl');
  }.property('buildUrl'),

  selectedExtensions: function() {
    return this.get('content').filterBy('isSelected', true);
  }.property('content.@each.isSelected')
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return [
      App.LtiExtension.create({
        isSelected: false,
        name: "Rich Editor Button (WYSIWYG)",
        optName: "editor_button",
        description: "This shows adding an editor button to the rich editor in course/group content. Editor button extensions show up in Canvas as icons in the right editor, in this case as a fish icon. This simple demo app lets the user pick from a list of fish pictures. The picture they choose will be inserted into the rich editor.",
        imageUrl: "/images/editor_button.png",
        link: "http://www.eduappcenter.com/docs/extensions/canvas_wysiwyg"
      }),
      App.LtiExtension.create({
        isSelected: false,
        name: "Resource Selection",
        optName: "resource_selection",
        description: "In Canvas you can configure an LTI tool to select LTI launch URLs as module items. This app allows the user to pick and insert custom content as a link in course modules. When inserting content into a module, if the user picks \"External Tools\" they'll see the configured app with a \"find\" icon.",
        imageUrl: "/images/resource_selection.png",
        link: "http://www.eduappcenter.com/docs/extensions/canvas_link_selection"
      }),
      App.LtiExtension.create({
        isSelected: false,
        name: "Homework Submission",
        optName: "homework_submission",
        description: "In Canvas you can configure an LTI tool to turn in homework through an LTI launch.",
        imageUrl: null,
        link: "http://www.eduappcenter.com/docs/extensions/canvas_homework_submission"
      }),
      App.LtiExtension.create({
        isSelected: false,
        name: "Account Navigation",
        optName: "account_navigation",
        description: "This link is available to anyone with access to the account. The link will appear in the current account and any sub-accounts of that account.",
        imageUrl: null,
        link: "http://www.eduappcenter.com/docs/extensions/canvas_navigation"
      }),
      App.LtiExtension.create({
        isSelected: false,
        name: "Course Navigation",
        optName: "course_navigation",
        description: "This link is available to anyone with access to the course. If it's configured at the account level, the link will be added to all courses within that account. Permissions can be set to determine which user types have access to the app, and whether the app is enabled by default for all applicable courses, or if it needs to be configured manually for each course.",
        imageUrl: "/images/course_navigation.png",
        link: "http://www.eduappcenter.com/docs/extensions/canvas_navigation"
      }),
      App.LtiExtension.create({
        isSelected: false,
        name: "User Navigation",
        optName: "user_navigation",
        description: "This link is available to anyone with access to the institution, and will appear as a navigation item whey they click their profile or user information link.",
        imageUrl: "/images/user_navigation.png",
        link: "http://www.eduappcenter.com/docs/extensions/canvas_navigation"
      })
    ]
  }
});
