require "test_helper"
require 'capybara/rails'

class TC008Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-008_Get all origin" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka halaman Setting
        find('#setting_page_btn').click

        # Test Step 3 - Pengguna melihat table origin
        visit setting_path
        assert page.has_content?("All Origin", wait: WAIT_TIME) 
        assert page.has_css?("div#origin_holder", wait: WAIT_TIME)

        assert_selector "div#origin_holder" do
            assert_selector "div" 
        end
    end
end
