class Announcement < ApplicationRecord
    belongs_to :posted_by, class_name: 'Employee', foreign_key: 'posted_by_id'
    belongs_to :concerned_position, class_name: 'Employee', foreign_key: 'concerned_position_id'
    validates :publication_date, presence: true
    validates :title, presence: true
    validates :message, presence: true
    validates :posted_by, presence: true
    validates :concerned_position, presence: true
  end