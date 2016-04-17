# == Schema Information
#
# Table name: subgoals
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  completed   :boolean          default("false")
#  goal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subgoal < ActiveRecord::Base
  belongs_to :goal
end
