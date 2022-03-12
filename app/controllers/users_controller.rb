class UsersController < ApplicationController

  #assigns a value to the user instance variable
  before_action :set_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
  end

end
