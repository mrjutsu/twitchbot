class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitch
		# You need to implement the method below in your model (e.g. app/models/user.rb)
		@user = User.from_omniauth(request.env["omniauth.auth"])
		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
			set_flash_message(:notice, :success, :kind => "Twitch") if is_navigational_format?
		else
		  puts @user.errors.inspect
      if @user.errors.any?
        flash[:error_login]= ""

        @user.errors.messages.each do |attr, message|
          flash[:error_login] += "- #{message.join('<br>')}"
        end

        redirect_to sign_in_path
      else
        session["devise.twitch_data"] = request.env["omniauth.auth"]
        redirect_to root_path
      end
		end
  end

end
