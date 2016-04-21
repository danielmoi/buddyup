# == Schema Information
#
# Table name: subgoals
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  completed   :boolean          default(FALSE)
#  goal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SubgoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
