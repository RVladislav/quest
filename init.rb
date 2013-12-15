require 'redmine'

Redmine::Plugin.register :quest do
  name 'Quest plugin'
  author 'Vladislav R.'
  description 'Votes'
  version '1.0.0'
  menu :top_menu, :questions, { :controller => 'questions', :action => 'index' }, :caption => 'Questions'
  #Вывод плагина в главном меню redmine
end