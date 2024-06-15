class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Пользователь успешно создан!'
    else
      flash.alert = @user.errors.full_messages.join('<br>')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :phonenumber, :password, :password_confirmation)
  end
end
