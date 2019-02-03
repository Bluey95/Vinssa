class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def update_admin
    @user = User.find(params[:id])
    @user.update_admin(@user)
    if @user.admin == true
      redirect_to users_path, notice: "Success!! #{@user.username} is now an admin"
    else
      redirect_to users_path, notice: "Sad, #{@user.username} is no longer an admin"
    end
  end

  def update_as_supplier
    @user = User.find(params[:id])
    @user.update_supplier(@user)
    if @user.supplier == true
      redirect_to users_suppliers_path, notice: "Success!! #{@user.username} is now a supplier"
    else
      redirect_to users_path, notice: "Sad, #{@user.username} is no longer a supplier"
    end
  end

  def supplier
    @users = User.where(:supplier => true)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end

end
