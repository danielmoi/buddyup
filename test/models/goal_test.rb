# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  achieved     :boolean          default("false")
#  acceptor_id  :integer
#  initiator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
