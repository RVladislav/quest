Redmine::Plugin.register :quest do
  name 'Quest plugin'
  author 'Vladislav R.'
  description 'Survey plugin'
  version '0.0.1'
  menu :top_menu, :questions, { :controller => 'questions', :action => 'index' }, :caption => 'Questions'
  #Вывод плагина в главном меню redmine
end