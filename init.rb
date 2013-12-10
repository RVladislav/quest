Redmine::Plugin.register :quest do
  name 'Quest plugin'
  author 'Vladislav R.'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  menu :application_menu, :questions, { :controller => 'questions', :action => 'index' }, :caption => 'Questions'
end