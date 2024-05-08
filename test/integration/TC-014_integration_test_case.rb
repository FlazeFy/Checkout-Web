require "test_helper"
require 'capybara/rails'

class TC014Test < ActionDispatch::IntegrationTest
    include Capybara::DSL
    WAIT_TIME = 10

    test "TC-014_Create place" do
        # Test Step 1 - Pengguna membuka aplikasi checkout
        visit '/'

        # Test Step 2 - Pengguna membuka halaman Setting
        find('#setting_page_btn').click
        visit setting_path

        # Test Step 3 - Pengguna membuka pop up form place
        find('#add_place_btn').click

        # Test Step 4 - Pengguna mengisi form
        assert page.has_content?("Add New Place", wait: WAIT_TIME) 

        find('#place_category').set('Origin')
        find('#place_name').set('Place C')

        # Test Step 5 - Pengguna menekan tombol submit
        find('#save_place').click
    end
end
