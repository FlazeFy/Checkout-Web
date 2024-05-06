require "test_helper"
require 'capybara/rails'

class TC011Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-011_Get all checkout type" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka halaman Setting
        find('#setting_page_btn').click

        # Test Step 3 - Pengguna melihat table Checkout type
        visit setting_path
        assert page.has_content?("Checkout Type", wait: WAIT_TIME) 
        assert page.has_css?("div#checkout_type_holder", wait: WAIT_TIME)

        assert_selector "div#checkout_type_holder" do
            assert_selector "div.col-lg-6.col-md-6.col-sm-12" 
        end
    end
end
