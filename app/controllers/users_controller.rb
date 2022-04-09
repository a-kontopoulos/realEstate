class UsersController < ApplicationController

  #assigns a value to the user instance variable
  before_action :set_user, only: [:show]

  def show
  end

  def new
    # creates the user instance variable
    @user = User.new
  end

  def create
    #assigns a value to the user instance variable using strong parameters
    @user = User.new(user_params)
    #checks if user can be saved using the provided parameters
    if @user.save
      #automatically logs user in
      log_in @user
      respond_to do |format|
        #redirects user to index page and displays message welcoming the user
        format.html { redirect_to user_path(@user), notice: 'Welcome to Zinoviev Properties' }
        flash[:success] = "Welcome to the Sample App!"
      end
    else
      #if user not successfully created render to new path
      render 'new'
    end
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    #finds the user and stores it in a user instance
    @user = User.find(params[:id])
  end

end
