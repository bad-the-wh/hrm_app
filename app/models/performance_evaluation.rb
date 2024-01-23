class PerformanceEvaluation < ApplicationRecord
    belongs_to :employee_reviewed, class_name: 'Employee', foreign_key: 'employee_reviewed_id'
    belongs_to :reviewer, class_name: 'Employee', foreign_key: 'reviewer_id'
    validates :evaluation_date, presence: true
    validates :employee_reviewed, presence: true
    validates :reviewer, presence: true
    validates :note, presence: true
    validates :commentary, presence: true
end  