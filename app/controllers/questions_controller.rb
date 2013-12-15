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
    Rails.logger.info "\e[31m " 
    Rails.logger.info params[:post]        
    Rails.logger.info "\e[0m"

    if params[:post][:newQuestion] != ''
      @q = Questions.new
      @q.textQuestion = params[:post][:newQuestion]
      if @q.save
        if params[:post][:newAnswerA] != ''
          @a = Answers.new
          @a.textAnswer = params[:post][:newAnswerA]
          @a.questions_id = Questions.last[:id]
          @a.save
        else
          @a = Answers.new
          @a.textAnswer = 'yes'
          @a.questions_id = Questions.last[:id]
          @a.save
        end
        if params[:post][:newAnswerB] != ''
          @a = Answers.new
          @a.textAnswer = params[:post][:newAnswerB]
          @a.questions_id = Questions.last[:id]
          @a.save
        else
          @a = Answers.new
          @a.textAnswer = 'no'
          @a.questions_id = Questions.last[:id]
          @a.save
        end
        if params[:post][:newAnswerC] != ''
          @a = Answers.new
          @a.textAnswer = params[:post][:newAnswerC]
          @a.questions_id = Questions.last[:id]
          @a.save
        else
          @a = Answers.new
          @a.textAnswer = "don't know"
          @a.questions_id = Questions.last[:id]
          @a.save
        end         
        flash[:notice] = 'New question was Saved'          
        redirect_to :action => 'index'      
      else
        flash[:notice] = 'oops'          
        redirect_to :action => 'index'
      end 
    end   
  end

  #Сохранение ответа пользователя
  def saveUserAnswer 
  	@userc = User.current.id
    #Useranswer.create(users_id: @userc, answers_id: "3")
  	flash[:notice] = 'Your answer was saved'
    redirect_to :action => 'index'
  end
end
