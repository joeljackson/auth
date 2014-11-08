class PagesController < ApplicationController
  include Auth::ControllerAuth

  before_filter :authenticate!

  def super_secret
  end
end
