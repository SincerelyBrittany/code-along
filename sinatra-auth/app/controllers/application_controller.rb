require "./config/environment"


class ApplicationController < Sinatra::Base

	configure do
    set :public_folder, 'public'
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end

  helpers do
    def logged_in?
      !!session[:email]
    end

    # def login(email,password)
		# 	#check if a user with this email actually exist
		# 	#if so set the establish_connection
		# 	#otherwise return false/something becuase its not found
		# 	if user = User.find_by(:email => email)
		# 		if user.authenticate(password) #if statement assignment
		# 		session[:email] = user.email
		# 		end
		# 	else
		# 		redirect '/login'
		# 	end
    #   #Is the user who they claim to be?
    #   # session[:email] = email
    # end

		def login(email,password)
			user = User.find_by(:email => email)
			if user && user.authenticate(password)
				session[:email] = user.email
			else
				redirect '/login'
			end
		end

    def logout!
      session.clear
      #emailing them to let them know they logged out
    end
  end


end
