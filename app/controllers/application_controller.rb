class ApplicationController < ActionController::Base
    # FIX THIS IN THE FUTURE SO THE ADMIN IS QUERIED FROM THE ADMIN DATABASE INSTEAD OF A HARDCODED
    # STRING
    def curr_user_is_admin? 
        if !session[:userinfo].nil? && session[:userinfo][:info][:email] == "talontest7@gmail.com"
          return true
        else
          return false
        end
      end
end