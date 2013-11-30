class Answer
  include Mongoid::Document
  field :user_id, type: String
  field :question_id, type: String
  field :answers, type: Hash
  belongs_to :user
  belongs_to :question
end
