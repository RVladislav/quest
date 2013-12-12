get 'questions', :to => 'questions#index' #Главная страница
post 'saveUserAnswer', :to => 'questions#saveUserAnswer' #Сохранение ответа пользователя
post 'showans', :to => 'questions#showans' #Показать ответы пользователя(всех, если администратор)
post 'addQuestion', :to => 'questions#addQuestion' #Добавить новый вопрос
post 'addAnswer', :to => 'questions#addAnswer' #Добавить новый вариант ответа
post 'saveNewQuestion', :to => 'questions#saveNewQuestion' #Сохранить новый вопрос