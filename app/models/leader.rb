class Leader < ApplicationRecord
  belongs_to :member
  belongs_to :department
  has_many :leadership_reports, dependent: :destroy
  has_many :outreach_reports, dependent: :destroy

  def department_leader
    "#{department.name}"
  end

  def member_name
    member = Member.find(member_id)
    "#{member.name}"
  end
  
end
