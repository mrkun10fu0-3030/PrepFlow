class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    staff: 0,
    manager: 1
  }

  has_many :prep_tasks, dependent: :destroy
end
