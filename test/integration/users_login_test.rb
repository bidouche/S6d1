require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
        @user_test = User.first
    end

   test "login with valid information" do
   get login_path
   assert_template 'sessions/new'
   # post login_path, session: { email: @user_test.email, 
   #           last_name: @user_test.last_name } 
   post login_path, params: { session: { email: @user_test.email},last_name: @user_test.last_name }
   assert is_logged_in?
   follow_redirect!
   assert_template "users/show"
   assert_select "a[href=?]", login_path, 0
   assert_select "a[href=?]", logout_path
 end

    test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", firstname: "" } }
    assert_template 'sessions/new'
    assert flash[:danger]
  end

      test "access club page is not public" do
    get club_path
    assert_redirected_to login_path
  end
end