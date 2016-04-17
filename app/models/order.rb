# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  amount        :integer
#  user_paid     :boolean          default("false")
#  user_refunded :boolean          default("false")
#  vault_paid    :boolean          default("false")
#  goal_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :goal
end
