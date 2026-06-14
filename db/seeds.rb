User.find_or_create_by!(email: "manager@example.com") do |u|
  u.password = "password"
  u.username = "店長"
  u.role = :manager
end

User.find_or_create_by!(email: "guest@example.com") do |u|
  u.password = SecureRandom.urlsafe_base64
  u.username = "ゲスト"
  u.role = :staff
end
