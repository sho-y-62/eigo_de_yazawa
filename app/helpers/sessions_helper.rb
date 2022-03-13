module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
  end
end
