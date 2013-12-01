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
    previous_question = Question.where(sequence: 1).first
    @answer = Answer.create(user: current_user,
                         question: previous_question,
                         answers: survey_params)

    @question = Question.where(sequence: 2).first
    @next_path = question3_survey_index_path

    render "questions"
  end

  def question3
    previous_question = Question.where(sequence: 2).first
    @answer = Answer.create(user: current_user,
                         question: previous_question,
                         answers: survey_params)

    @question = Question.where(sequence: 3).first
    @next_path = question4_survey_index_path

    render "questions"
  end

  def question4
    previous_question = Question.where(sequence: 3).first
    @answer = Answer.create(user: current_user,
                         question: previous_question,
                         answers: survey_params)

    @question = Question.where(sequence: 4).first
    @next_path = question5_survey_index_path

    render "questions"
  end

  def question5
    previous_question = Question.where(sequence: 4).first
    @answer = Answer.create(user: current_user,
                         question: previous_question,
                         answers: survey_params)

    @question = Question.where(sequence: 5).first
    @next_path = question6_survey_index_path

    render "questions"
  end
  private
    def survey_params
      params.permit("multiple_choice", "number_range",
                    "checkbox", "dropdown", {date_range: []})
    end

    def previous_question
      #implement this when you finish the code or when you are bored hehe
      this_method_name
      #current_method = __method__
      #raise current_method.to_yaml
    end

    def current_user
      User.find(session[:user])
    end
end
