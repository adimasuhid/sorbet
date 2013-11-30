class SurveyController < ApplicationController
  def index

  end

  def question1
    session[:user] ||= User.create!(ip: request.ip)
    @question = Question.first
    render "questions"
  end

  def question2
    raise params.to_yaml
  end
end
