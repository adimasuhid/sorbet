class Question
  include Mongoid::Document
  field :title, type: String
  field :question_type, type: Array
  field :choices, type: Array
  field :description, type: String
  field :sequence, type: Integer
  has_many :answers

  QUESTION_TYPES = {
    multiple_choice: "multiple_choice",
    date_range: "date_range",
    number_range: "number_range",
    checkbox: "checkbox",
    dropdown: "dropdown"
  }

end
