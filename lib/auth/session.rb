class Auth::Session
  include ActiveModel::Model

  attr_accessor :username, :password
  validates_presence_of :username, :password

  validate :user_exists
  validate :proper_password

  def user
    @user ||= User.find_by_username(username)
  end

  private
  def user_exists
    errors.add(:username, "There is no such user!") unless user
  end

  def proper_password
    errors.add(:password, "Invalid password") unless Auth::AuthenticationDecorator.new(user).is_authentic?(password)
  end
end
