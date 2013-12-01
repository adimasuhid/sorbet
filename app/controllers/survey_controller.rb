class SurveyController < ApplicationController
  def index

  end

  def question1
    session[:user] ||= User.create!(ip: request.ip).id
    @question = Question.where(sequence: 1).first
    @next_path = question2_survey_index_path

    render "questions"
  end

  def question2
    process_question(2)
  end

  def question3
    process_question(3)
  end

  def question4
    process_question(4)
  end

  def question5
    process_question(5)
  end

  def question6
    process_question(6)
  end

  def question7
    @previous_question = Question.where(sequence: 6).first
    options = {user: current_user, question: @previous_question}
    save_answers(options)
    render "thank_you"
  end

  private
    def survey_params
      params.permit("multiple_choice", "number_range", "checkbox", "dropdown", {date_range: []})
    end

    def current_user
      User.find(session[:user])
    end

    def process_question(number)
      @previous_question = Question.where(sequence: number-1).first
      @question = Question.where(sequence: number).first
      @next_path = send("question#{number+1}_survey_index_path")
      @back_path = send("question#{number-1}_survey_index_path")

      options = {user: current_user, question: @previous_question}
      save_answers(options) #add error handling

      render "questions"
    end

    def save_answers(options)
      @answer = Answer.where(options).first || Answer.create(options)
      @answer.update_attributes(answers: survey_params)
    end
end
