require "test_helper"
require 'capybara/rails'

class TC001Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-001_Get all checkout" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka halaman History
        find('#history_page_btn').click

        # Test Step 3 - Pengguna melihat table checkout
        visit history_path
        assert page.has_content?("All Checkout", wait: WAIT_TIME) 
        assert page.has_css?("tbody#tb_checkout_body", wait: WAIT_TIME)

        assert_selector "tbody#tb_checkout_body" do
            assert_selector "tr" 
        end
    end
end
