class Message
  include ActiveModel::Model
  attr_accessor :name, :body, :email
  validates :name, :body, :email, presence: true
end
