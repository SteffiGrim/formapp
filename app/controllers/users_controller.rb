class UsersController < ApplicationController
  before_action :authenticate_admin, only: :index

  def index
    @users = User.all
    @user_count = @users.count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "¡Gracias por registrarte!"
    else
      render :new
    end
  end

  private

  def authenticate_admin
    authenticate_or_request_with_http_basic("Administration") do |username, password|
      username == "admin" && password == "secret123" # Cambia estas credenciales
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :phone, :address, :comments, :document_number)
  end
end
