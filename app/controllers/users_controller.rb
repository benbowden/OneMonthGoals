class UsersController < ApplicationController
   def show
    @user = User.find(params[:id])
    @pins = Pin.where(:user_id => params[:id])
  end
end
