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

class SubgoalsControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
