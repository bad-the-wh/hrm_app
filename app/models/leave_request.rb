# app/models/leave_request.rb
class LeaveRequest < ApplicationRecord
    belongs_to :employee, class_name: 'Employee', foreign_key: 'employee_id'
    validates :employee, presence: true
    validates :request_date, presence: true
    validates :leave_start_date, presence: true
    validates :leave_end_date, presence: true 
    validates :response, presence: true
end  