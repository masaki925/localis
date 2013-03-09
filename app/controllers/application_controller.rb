class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env.production?
    http_basic_authenticate_with :name => ENV['BASIC_ID'], :password => ENV['BASIC_PASS']
  end

end
