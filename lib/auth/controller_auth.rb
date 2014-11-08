module Auth::ControllerAuth
  private
  def authenticate!
    head :unauthorized unless session[:user_id] && User.find(session[:user_id])
  end

  def sign_in
    auth_session = Auth::Session.new(params[:auth_session])
    raise ActiveRecord::RecordInvalid.new(auth_session) unless auth_session.valid?
    session[:user_id] = auth_session.user.id
  end
end
