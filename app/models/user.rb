class User
  include Mongoid::Document
  field :ip, type: String
  field :email, type: String
  has_many :answers
end
