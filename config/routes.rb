#get 'questions', :to => 'questions#index' #Главная страница
#post 'saveUserAnswer', :to => 'questions#saveUserAnswer' #Сохранение ответа пользователя
#post 'showans', :to => 'questions#showans' #Показать ответы пользователя(всех, если администратор)
#post 'addQuestion', :to => 'questions#addQuestion' #Добавить новый вопрос
#post 'addAnswer', :to => 'questions#addAnswer' #Добавить новый вариант ответа
#post 'saveNewQuestion', :to => 'questions#saveNewQuestion' #Сохранить новый вопрос

RedmineApp::Application.routes.draw do
  match '/questions/index', :to => 'questions#index', :via => [:get, :post]
  match '/questions/saveUserAnswer', :to => 'questions#saveUserAnswer', :via => [:get, :post] #Сохранение ответа пользователя
  match '/questions/showans', :to => 'questions#showans', :via => [:get, :post] #Показать ответы пользователя(всех, если администратор)
  match '/questions/addQuestion', :to => 'questions#addQuestion', :via => [:get, :post] #Добавить новый вопрос
  match '/questions/addAnswer', :to => 'questions#addAnswer', :via => [:get, :post] #Добавить новый вариант ответа  
  match '/questions/saveNewQuestion', :to => 'questions#saveNewQuestion', :via => [:get, :post] #Сохранить новый вопрос
  match '/questions/delAllAnswers', :to => 'questions#delAllAnswers', :via => [:get, :post]#Удаление всех ответов пользователей
  match '/questions/delQuestion', :to => 'questions#delQuestion', :via => [:get, :post]#Удаление вопроса
end