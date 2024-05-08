require "test_helper"
require 'capybara/rails'

class TC015Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-015_Create checkout type" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka halaman Setting
        find('#setting_page_btn').click
        visit setting_path

        # Test Step 3 - Pengguna membuka pop up form checkout type
        find('#add_checkout_type_btn').click

        # Test Step 4 - Pengguna mengisi form
        assert page.has_content?("Add New Checkout Type", wait: WAIT_TIME) 

        find('#checkout_type').set('Random')

        # Test Step 5 - Pengguna menekan tombol submit
        find('#save_checkout_type').click
    end
end
