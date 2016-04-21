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

module GoalsHelper

  def goal_status(goal)
    if goal.achieved
      status = "Congratulations, you've achieved your goal"
    else
      status = "In progress"
    end
  end

end
