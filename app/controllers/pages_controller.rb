class PagesController < ApplicationController
  http_basic_authenticate_with name: "joel", password: "joelisthebest"

  def super_secret
  end
end
