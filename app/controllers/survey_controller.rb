class SurveyController < ApplicationController
  before_filter :create_session, except: :index

  def index

  end

  def question
    process_question(params[:id].to_i)
  end

  private
    def survey_params
      params.permit("id","multiple_choice", "number_range", "checkbox", "dropdown", {date_range: []})
    end

    def process_question(number)
      save_answers_to(number)

      if @question = Question.where(sequence: number).first
        @next_path = question_survey_path(number+1)
        @back_path = question_survey_path(number-1)

        render "questions"
      else
        #redirect to different path?
        render "thank_you"
      end
    end

    def save_answers_to(question_number)
      previous_question = Question.where(sequence: question_number-1).first

      options = {user: current_user, question: previous_question}
      save_answers(options) #add error handling
    end

    def save_answers(options)
      @answer = Answer.where(options).first || Answer.create(options)
      @answer.update_attributes(answers: survey_params)
    end
end
