class Leader < ApplicationRecord
  belongs_to :member
  belongs_to :department

  def department_leader
    "#{department.name}"
  end

  def member_name
    member = Member.find(member_id)
    "#{member.name}"
  end
  
end
