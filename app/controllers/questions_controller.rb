class QuestionsController < ApplicationController
  unloadable
  def index
	@ques = Questions.all
  end

  def showans
    @ua = Useranswer.all
    @ques = Questions.all
    @us = User.all
  end

  def addQuestion

  end

  def addAnswer

  end

  def saveAnswer
    Questions.create(textQuestion: 'df')
    flash[:notice] = 'Save'
  end

  def ans 
  	@userc = User.current.id
    Useranswer.create(users_id: @userc, answers_id: "3")
  	flash[:notice] = 'Save'
	redirect_to :action => 'index'
  end
end
