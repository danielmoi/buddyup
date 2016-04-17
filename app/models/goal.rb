class Goal < ActiveRecord::Base
  belongs_to :acceptor, class_name: "User", foreign_key: "acceptor_id"
  belongs_to :initiator, class_name: "User", foreign_key: "initiator_id"
  has_and_belongs_to_many :categories
  has_many :subgoals
  has_many :orders
end
