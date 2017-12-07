require_relative '../config/environment'
require_relative 'runner_helper'
ActiveRecord::Base.logger = nil

def runner
  user = user_login
  home_screen(user)
end

runner
