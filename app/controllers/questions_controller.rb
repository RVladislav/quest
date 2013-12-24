class QuestionsController < ApplicationController
  unloadable
  #Главная страница приложения
  def index
	  @ques = Questions.all
    @ua = Useranswer.all
    @currentUs = Useranswer.where(users_id: User.current.id)
  end

  #Просмотр ответов
  def showans
    @ua = Useranswer.all
    @ques = Questions.all
    @us = User.all
  end

  #Удаление вопроса
  def delQuestion
    @dq = Questions.all

    Rails.logger.info "\e[31m " 
    Rails.logger.info params[:post]
    Rails.logger.info "\e[0m"

    if params[:post] != nil
      @dq.each do |qd|
        if params[:post][qd.id.to_s()] == '1'
          Questions.destroy(qd.id)
          @a = Answers.where(:questions_id => qd.id)
          @u = Useranswer.where(:answers_id => Answers.where(:questions_id => qd.id))
          @u.destroy_all
          @a.destroy_all
        end
      end
      flash[:notice] = 'Deleted'
      redirect_to :action => 'index'
    end
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
        if params[:post][:newAnswerA] == '' and params[:post][:newAnswerB] == ''
          @a = Answers.new
          @a.textAnswer = 'yes'
          @a.questions_id = Questions.last[:id]# Варианты ответа для последнего вопроса
          @a.save
          @a = Answers.new
          @a.textAnswer = 'no'
          @a.questions_id = Questions.last[:id]
          @a.save
          @a = Answers.new
          @a.questions_id = Questions.last[:id]
          @a.save
        else
          if params[:post][:newAnswerA] != '' #Добавление 
            @a = Answers.new
            @a.textAnswer = params[:post][:newAnswerA]
            @a.questions_id = Questions.last[:id]
            @a.save
            @a = Answers.new
            @a.questions_id = Questions.last[:id]
            @a.save            
          end
          if params[:post][:newAnswerB] != ''
            @a = Answers.new
            @a.textAnswer = params[:post][:newAnswerB]
            @a.questions_id = Questions.last[:id]
            @a.save
            @a = Answers.new
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
    else
      flash[:notice] = 'oops. Question was empty' #Если вопрос пустой 
      redirect_to :action => 'index'        
    end   
  end

  #Сохранение ответа пользователя
  def saveUserAnswer 
    Rails.logger.info "\e[31m " 
    Rails.logger.info params[:post]
    Rails.logger.info "\e[0m"

    if Useranswer.where(:users_id => User.current.id) != nil
      Useranswer.destroy_all(:users_id => User.current.id)
    end
    for i in 1..Questions.count(:id) do
      if params[:post][i.to_s()] != nil #Проверка, что ответ дан. Сохранение
        @usAnswer = Useranswer.new
        @usAnswer.users_id = User.current.id
        @usAnswer.answers_id = params[:post][i.to_s()]
        #Если поле выбора ответа пустое, что значит: был выбран свободный ответ, то помимо остальной информации в таблицу добавляем текст ответа
        if Answers.where(:id => params[:post][i.to_s()]).last.textAnswer == nil
          @text = '_' + params[:post][i.to_s()].to_s()
          @usAnswer.answer_freeForm = params[:post][@text]
        end
        @usAnswer.save
        flash[:notice] = 'Your answer was saved'
        @check = true #Если ответ сохранён(хотябы 1), то выводится сообщение и флаг => true
      end
    end
    if @check != true #Если сохранений не было, выводим ошибку
      flash[:error] = 'Empty answer not was saved'
    end
    redirect_to :action => 'index'
  end

end