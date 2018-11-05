class HomepageConstraint
  def matches?(request)
   # in most cases, you'd store your user_id or other params for determining the current user in a session
   request.session[:user_id].present?
  end
end