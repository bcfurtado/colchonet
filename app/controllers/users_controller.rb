class UsersController < ApplicationController

  def new
    @user = User.new    
  end

  def create
    @user = User.create(create_params)
    if @user.save
      SignupMailer.confirm_email(@user).deliver
      redirect_to @user, :notice => 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(create_params)
      redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  private

    def create_params
      params.require(:user).permit(:email, :full_name, :bio, :location,
        :password, :password_confirmation)
    end

end
