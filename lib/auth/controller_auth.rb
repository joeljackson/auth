module Auth::ControllerAuth
  private
  def authenticate!
    user = User.find_by_username(params[:username])
    

    head :unauthorized unless params[:username].present? && params[:password].present? && user.present? && user.password == params[:password]
  end
end
