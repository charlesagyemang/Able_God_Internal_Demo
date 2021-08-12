class Leader < ApplicationRecord
  belongs_to :member
  belongs_to :department

  def department_leader
    "#{department.name}"
  end
  
end
