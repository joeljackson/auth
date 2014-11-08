module Auth::ControllerAuth
  private
  def authenticate!
    users = {
      joel: 'awesome',
      justin: 'sortofawesome',
      jonny: 'finehesallowedontoo'
    }

   head :unauthorized unless params[:username].present? && params[:password].present? && users[params[:username].to_sym] == params[:password]
  end
end
