class QuestionsController < ApplicationController
  unloadable
  #Главная страница приложения
  def index
	  @ques = Questions.all
    @ua = Useranswer.all
  end

  #Просмотр ответов
  def showans
    @ua = Useranswer.all
    @ques = Questions.all
    @us = User.all
  end

  #Добавление вопроса
  def addQuestion
  end

  #Добавление нового варианта ответа
  def addAnswer
    flash[:notice] = 'New answer was added'
  end

  #Сохранение нового вопроса
  def saveNewQuestion
    #Questions.create(textQuestion: 'df')
    flash[:notice] = 'New question was Saved'
  end

  #Сохранение ответа пользователя
  def saveUserAnswer 
  	@userc = User.current.id
    #Useranswer.create(users_id: @userc, answers_id: "3")
  	flash[:notice] = 'Your answer was saved'
    redirect_to :action => 'index'
  end
end
