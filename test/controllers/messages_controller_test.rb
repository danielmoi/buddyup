# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  initiator_id :integer
#  acceptor_id  :integer
#  subject      :text
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
#  goal_id      :integer
#

require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
