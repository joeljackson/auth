module Auth::ControllerAuth
  private
  def authenticate!
    user = User.find_by_username(params[:username])
    
    head :unauthorized unless params[:username].present? && params[:password].present? && user.present? && user.password == Digest::SHA512.new.update(params[:password]).to_s
  end
end
