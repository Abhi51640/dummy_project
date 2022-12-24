class UsersController < ApplicationController

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(posts_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def find_post
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path 
  end


  private
  def user_params
   params.require(:user).permit(:email, :first_name, :last_name, :mobile, :username, :password, :gender)
  end
end
