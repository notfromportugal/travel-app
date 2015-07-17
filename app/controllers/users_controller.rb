class UsersController < ApplicationController

  def index
    @users = User.all
  end

  #return a view named 'new' that will be used to register a new user
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @letters = @user.letters
  end

  def create
      user = User.new(user_params)
      if user.save
        #redicret to signed in
        flash[:success] = 'you are registered'
        redirect_to new_session_path
      else

        flash[:error] = 'registration has failed'

        redirect_to new_user_path

      end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end

end