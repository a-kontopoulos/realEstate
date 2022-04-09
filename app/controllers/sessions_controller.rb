class SessionsController < ApplicationController
  def new
    #debugger
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
       reset_session
       log_in user
       redirect_to user
     else

       # render 'new'

       respond_to do |format|
         format.html { redirect_to login_path, alert: 'Invalid email/password combination' }
         # flash.now[:danger] = 'Invalid email/password combination'
       end
     end
   end

  #action that deletes user's id from session
  def destroy
    log_out
    #redirects user to homepage
    redirect_to root_path, status: :see_other
  end



end
