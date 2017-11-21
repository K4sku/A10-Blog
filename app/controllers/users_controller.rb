class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :require_user, only: %i[edit]
  before_action :require_same_user, only: %i[edit update]


  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to A10-Blog #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Account was updated'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return if current_user == @user
    flash[:danger] = 'You can edit only your own profile'
    redirect_to root_path
  end

end