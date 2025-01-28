class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user, only: [:edit, :update]
  before_action :authorize_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Cadastro realizado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "Informações atualizadas com sucesso!"
    else
      flash.now[:alert] = "Não foi possível atualizar suas informações."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email, :cpf, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_to root_path, alert: "Acesso não autorizado." unless @user == current_user
  end
end
