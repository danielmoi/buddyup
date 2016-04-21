# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  achieved     :boolean          default(FALSE)
#  acceptor_id  :integer
#  initiator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  amount       :integer
#

class Goal < ActiveRecord::Base
  belongs_to :acceptor, class_name: "User", foreign_key: "acceptor_id"
  belongs_to :initiator, class_name: "User", foreign_key: "initiator_id"
  has_and_belongs_to_many :categories
  has_many :subgoals, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy
    attr_accessor :created_date_formatted, :created_date_ago, :this_is_the_date
    def attributes
      #super.merge('this_is_the_date' => self.this_is_the_date )
      super.merge('created_date_ago' => self.created_date_ago)
    end
end
