require "test_helper"
require 'capybara/rails'

class TC005Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-005_Get all destination" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka halaman Setting
        find('#setting_page_btn').click

        # Test Step 3 - Pengguna melihat table destination
        visit setting_path
        assert page.has_content?("All Destination", wait: WAIT_TIME) 
        assert page.has_css?("div#destination_holder", wait: WAIT_TIME)

        assert_selector "div#destination_holder" do
            assert_selector "div" 
        end
    end
end
