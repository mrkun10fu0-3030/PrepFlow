cat > test/system/application_system_test_case.rb << 'EOF'
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test
end
EOF