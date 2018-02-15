# User Controller
class UsersController < ApplicationController
  # def index
  #  @user = User.all
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @user.to_json }
  #  end
  # end

  # GET /users
  def index
    @user = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Dziękujemy za rejestrację! Zostałeś zalogowany!'
      redirect_to @user
    else
      render :new
    end
  end

  # GET /users/1/edit
  def edit
    # TODO: Add edit user profile
  end

  # PATCH/PUT /users/1
  def update
    # TODO: Add update information on profile
  end

  # DELETE /users/1
  def destroy
    # TODO: Add delete users
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end
