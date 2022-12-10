class UsersController < ApplicationController

  def index 
    @users = User.all
    @user = User.all.where("id!=?", current_user.id)
  end
end
