class User < ApplicationRecord
  before_create :set_role
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  enum :role, {
    staff: 0,
    manager: 1
  }

  has_many :prep_tasks, dependent: :destroy

  protected

  def set_role
    self.role = :manager if User.count.zero?
  end
end
