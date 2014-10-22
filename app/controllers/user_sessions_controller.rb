class UserSessionsController < ApplicationController

  def new
    @session = UserSession.new(session)
  end

  def create
    @session = UserSession.new(session, params[:user_session])
    if @session.authenticate
      redirect_to root_path, :notice => 'Logado'
    else
      render :new
    end
  end

  def destroy
    user_session.destroy
    redirect_to root_path, :notice => 'Deslogado com sucesso!'
  end
  
end