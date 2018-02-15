class SessionsController < ApplicationController
  def new; end

  def create
    user     = User.find_by(email: params[:session][:email].downcase)
    password = Digest::SHA1.hexdigest(params[:session][:password])

    if user && (password.eql?user.password)
      log_in user
      flash[:success] = 'Zalogowano pomyślnie!'
      redirect_to user
    else
      flash[:danger] = 'Nieprawidłowy e-mail lub hasło.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
