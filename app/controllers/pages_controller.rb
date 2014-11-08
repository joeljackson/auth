class PagesController < ApplicationController
  before_filter :authenticate!

  def super_secret
  end

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
