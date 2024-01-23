class Employee < ApplicationRecord
  validates :LDAP, presence: true
  validates :name, presence: true
  validates :position, presence: true
  validates :email, presence: true
  validates :birthdate, presence: true
  has_many :posted_announcements, class_name: 'Announcement', foreign_key: 'posted_by_id'
  has_many :concerned_announcements, class_name: 'Announcement', foreign_key: 'concerned_position_id'
  has_many :evaluations_received, class_name: 'PerformanceEvaluation', foreign_key: 'employee_reviewed_id'
  has_many :evaluations_given, class_name: 'PerformanceEvaluation', foreign_key: 'reviewer_id'
  has_many :leave_requests, class_name: 'LeaveRequest', foreign_key: 'employee_id'
end