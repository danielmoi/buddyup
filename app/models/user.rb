class User < ActiveRecord::Base
  acts_as_messageable
  # ^^this creates all the mailboxer methods on the User object

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  # ^^ can't enter password without email address, must be unique

  has_many :goals_initiated, class_name: 'Goal', foreign_key: "initiator_id"
  has_many :goals_accepted, class_name: 'Goal', foreign_key: "acceptor_id"

# //////// ADDED FOR MAILBOXER ///////////
  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end
  # //////////////////////////////
end
