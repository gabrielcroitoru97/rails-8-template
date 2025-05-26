class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
 
 # before_action :authenticate_user!, except: [:index, :show]
  #before_action :authorize_user!, only: [:edit, :update, :destroy]


  # GET /users/1 or /users/1.json
  def show
    @user = User.find_by!(username: params.fetch(:username))
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

end
