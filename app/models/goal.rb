class Goal < ActiveRecord::Base

  belongs_to :acceptor, class_name: "User",
  foreign_key: "acceptor_id"

  belongs_to :intiator, class_name: "User",
  foreign_key: "initiator_id"

end

# g = Goal.first
#
# g.acceptor
# g.initiator
#
# g.users # won't work
