class User < ActiveRecord::Base
  def password=(password)
    write_attribute(:password, Digest::SHA512.new.update(password).to_s)
  end
end
