class User < ApplicationRecord
  before_create :set_role
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  enum :role, {
    staff: 0,
    manager: 1
  }

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲスト"
    end
  end

  has_many :prep_tasks, dependent: :destroy

  protected

  def self.guest_manager
    User.find_by!(email: "manager@example.com")
  end

  def set_role
    return if email == "guest@example.com"
    self.role = :manager if User.count.zero?
  end
end
