class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :me]

  def me
    render json: { user: @current_user}, status: 200
  end

  def index
    render json: User.all, status: 200
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])

      render json: {user: user}, status: 200
    end
  end

  def signup
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: {user: user}, status: 200
    else
      render json: {error: user.errors.full_messages[0]}, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    if @current_user.id == user.id
      render json: {user: user}, status: 200
    else
      render json: {error: "Access denied, imposter alert!"}, status: 401
    end
  end

end
