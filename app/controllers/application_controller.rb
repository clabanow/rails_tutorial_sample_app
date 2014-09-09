class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # all helpers are available by default in the views rather than controller
  # to get into controller, we have to explicity include it
  include SessionsHelper
end
