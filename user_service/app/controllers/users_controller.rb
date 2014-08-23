class UsersController < ApplicationController

  before_filter :find_user, except: [:create, :find]

  respond_to :json

  def create
    @user = User.create(user_params)
    if @user.save
      respond_with @user
    else
      respond_with @user.errors, 400
    end
  end

  def find
    @user = User.find_by_email(params[:email])
    respond_with @user
  end

  def update
    @user.update_attributes(user_params)
    head 204
  end

  def destroy
    @user.destroy
    head 200
  end

  def show
    respond_with @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head 404
  end

  def user_params
    params[:user].permit([:email, :password])
  end

end
