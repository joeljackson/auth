class SessionsController < ApplicationController
  include Auth::ControllerAuth

  def new
    @session = Auth::Session.new
  end

  def create
    sign_in
    redirect_to super_secret_pages_path
  rescue ActiveRecord::RecordInvalid => e
    @session = e.record
    render :new
  end

  def destroy
    sign_out
    redirect_to new_auth_sessions_path
  end
end
