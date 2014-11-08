class Auth::AuthenticationDecorator
  def initialize(authenticatable)
    @authenticatable = authenticatable
  end
  
  def is_authentic?(password)
    @authenticatable.present? &&
      password.present? &&
      @authenticatable.password == Digest::SHA512.new.update(password).to_s
  end
end
