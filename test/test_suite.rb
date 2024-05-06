$LOAD_PATH.unshift(File.expand_path('../test', __dir__))

# Exec : ruby -Itest test/test_suite.rb 

# Integration
require_relative 'integration/TC-001_integration_test_case.rb'
require_relative 'integration/TC-005_integration_test_case.rb'
require_relative 'integration/TC-008_integration_test_case.rb'
require_relative 'integration/TC-011_integration_test_case.rb'