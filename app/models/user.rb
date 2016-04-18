# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  image_url       :string
#  password_digest :string
#  bio             :text
#  country         :string
#  city            :string
#  admin           :boolean          default("false")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  # ^^ can't enter password without email address, must be unique

  has_many :goals_initiated, class_name: 'Goal', foreign_key: "initiator_id"
  has_many :goals_accepted, class_name: 'Goal', foreign_key: "acceptor_id"

end
