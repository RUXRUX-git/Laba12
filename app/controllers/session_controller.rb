class SessionController < ApplicationController
  skip_before_action :require_login, only: [:login, :create]

  def login
  end

  def create
    user = User.find_by username: params[:username]

    if user&.authenticate(params[:password])
      sign_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'Неверный логин/пароль!'
      redirect_to session_login_url
    end
  end

  def logout
    sign_out
    redirect_to session_login_url
  end
end
