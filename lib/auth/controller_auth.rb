module Auth::ControllerAuth
  def self.included(klass)
    klass.send :helper_method, :current_user
  end

  def current_user
    @controller_auth_current_user ||= User.find(session[:user_id])
  end

  private
  def authenticate!
    head :unauthorized unless session[:user_id] && current_user
  end


  def sign_in
    auth_session = Auth::Session.new(params[:auth_session])
    raise ActiveRecord::RecordInvalid.new(auth_session) unless auth_session.valid?
    session[:user_id] = auth_session.user.id
    current_user.update_attribute(:last_sign_in, Time.now)
    true
  end

  def sign_out
    session.delete(:user_id)
  end
end
