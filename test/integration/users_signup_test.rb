require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "valid signup information" do
    get login_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name:  "Example User",last_name:  "Example User",
                                         email: "user@example.com", } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
  test "invalid signup information" do
    get login_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  "",last_name:  "",
                                         email: "user@invalid" } } 
    end
    assert_redirected_to login_path  
  end
end