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

  #Удаление всех ответов пользователей
  def delAllAnswers
    Useranswer.destroy_all
    redirect_to :action => 'index'
  end

  #Сохранение нового вопроса
  def saveNewQuestion
    Rails.logger.info "\e[31m " 
    Rails.logger.info params[:post]        
    Rails.logger.info "\e[0m"

    if params[:post][:newQuestion] != '' #Сохранение ответа, если поле не пустое
      @q = Questions.new
      @q.textQuestion = params[:post][:newQuestion]
      if @q.save
        #Если все поля ответа пустые, заполняются базовые ответы
        if params[:post][:newAnswerA] == '' and params[:post][:newAnswerB] == '' and params[:post][:newAnswerC] == ''
          @a = Answers.new
          @a.textAnswer = 'yes'
          @a.questions_id = Questions.last[:id]
          @a.save
          @a = Answers.new
          @a.textAnswer = 'no'
          @a.questions_id = Questions.last[:id]
          @a.save
          @a = Answers.new
          @a.textAnswer = "don't know"
          @a.questions_id = Questions.last[:id]
          @a.save
        else
          if params[:post][:newAnswerA] != '' #Добавление 
            @a = Answers.new
            @a.textAnswer = params[:post][:newAnswerA]
            @a.questions_id = Questions.last[:id]
            @a.save
          end
          if params[:post][:newAnswerB] != ''
            @a = Answers.new
            @a.textAnswer = params[:post][:newAnswerB]
            @a.questions_id = Questions.last[:id]
            @a.save
          end
          if params[:post][:newAnswerC] != ''
            @a = Answers.new
            @a.textAnswer = params[:post][:newAnswerC]
            @a.questions_id = Questions.last[:id]
            @a.save
          end  
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
    Rails.logger.info "\e[31m " 
    Rails.logger.info params[:post]
    Rails.logger.info "\e[0m"

    if params[:post] != nil
      for i in 1..Questions.count(:id) do
        if params[:post][i.to_s()] != nil #Проверка, что ответ дан. Сохранение
          @usAnswer = Useranswer.new
          @usAnswer.users_id = User.current.id
          @usAnswer.answers_id = params[:post][i.to_s()]
          @usAnswer.save
        end
      end
      flash[:notice] = 'Your answer was saved'
    end
    redirect_to :action => 'index'
  end
end