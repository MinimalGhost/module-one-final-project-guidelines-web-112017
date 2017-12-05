require_relative '../config/environment'
require_relative 'runner_helper'

def runner
  user = user_login
  home_screen(user)
end

runner
