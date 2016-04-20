module GoalsHelper

  def goal_status(goal)
    if goal.achieved
      status = "Congratulations, you've achieved your goal"
    else
      status = "In progress"
    end
  end

end
