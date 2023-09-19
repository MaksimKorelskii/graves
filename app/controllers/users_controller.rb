class UsersController < ApplicationController
  before_action :set_user!, only: %i[edit update]

  def edit
  end

  def update
    # render plain: params.to_yaml and return
    if @user.update user_params
      redirect_to edit_user_path(@user)
      flash[:success] = 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
