class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :balance, :feed, :payment]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def payment
    if Transaction.new.payment(user.id,params[:friend_id],params[:amount],params[:description])
      render json: User.where(id: params[:friend_id]).first
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def feed
    render json: Transaction.page(1)
  end

  def balance
    render json: user.balance
  end


  private

    def user
      @user ||= User.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :balance, :description, :friend_id, :amount)
    end
end
