require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user_test = User.first
  end
 
  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user_test.email, last_name: @user_test.last_name} }
    assert is_logged_in?
    #assert_redirected_to '/users/1'
    #follow_redirect!
    #assert_template 'users/show'
    #assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path, count: 1
    #assert_select "a[href=?]", user_path(@user)
  end
end