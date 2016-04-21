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

require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
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
