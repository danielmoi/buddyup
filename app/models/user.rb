class User < ActiveRecord::Base
  has_many :goals_initiated, class_name: 'Goal', foreign_key: "initiator_id"
  has_many :goals_accepted, class_name: 'Goal', foreign_key: "acceptor_id"
end
