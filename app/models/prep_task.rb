class PrepTask < ApplicationRecord
  belongs_to :user
  belongs_to :staff, class_name: "User", optional: true
  scope :incomplete, -> { where(completed: false) }
  scope :by_date, ->(date) { where(prep_date: date) }
  enum :priority, { low: 0, medium: 1, high: 2 }
end
