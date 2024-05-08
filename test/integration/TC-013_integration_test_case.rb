require "test_helper"
require 'capybara/rails'

class TC013Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-013_Create checkout" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka pop up create checkout
        find('#open_modal_form_checkout').click

        # Test Step 3 - Pengguna mengisi form
        assert page.has_content?("Make Checkout", wait: WAIT_TIME) 

        find('#checkout_type').set('Back Home')
        find('#checkout_origin').set('My Kost')
        find('#checkout_destination').set('Telkom Landmark Tower')
        find('#checkout_desc_input').set('This is descripiton [TEST]')

        # Test Step 4 - Pengguna menekan tombol submit
        find('#save_checkout').click
    end
end
