class ApplicationController < ActionController::Base
  before_action :authenticate_register_user!
end
