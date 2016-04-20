module GoalsHelper

  def goal_status(goal)
    if goal.achieved
      status = 'Achieved'
    else
      status = 'In progress'
    end
  end

  def goal_achieved(goal)
    
  end

end
