# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  amount        :integer
#  user_paid     :boolean          default(FALSE)
#  user_refunded :boolean          default(FALSE)
#  vault_paid    :boolean          default(FALSE)
#  goal_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

module OrdersHelper
end
