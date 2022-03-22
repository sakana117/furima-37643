class ApplicationController < ActionController::Base
  authenticate_or_request_with_http_basic do |username, password|
    username == 'furima' && password == '37643'
  end
end
