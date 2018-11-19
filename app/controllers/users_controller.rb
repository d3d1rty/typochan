##
# = UsersController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing user resources.
class UsersController < Clearance::UsersController
  before_action :set_user, only: %i[show edit edit_profile update destroy]
  before_action :protect_user_resources, only: %i[edit edit_profile update destroy]

  ##
  # GET /users/new
  def new
    @user = User.new
  end

  ##
  # GET /users/:user_id
  def show; end

  ##
  # GET /users/:user_id/edit
  def edit; end

  ##
  # POST /users
  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        sign_in @user
        flash[:message] = 'Account creation successful.'
        flash[:type] = 'success'
        format.html { redirect_to url_after_create }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /users/:user_id
  #
  # PATCH/PUT /users/:user_id.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:message] = 'User information was successfully updated.'
        flash[:type] = 'success'
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  ##
  # Protects against directory traversal
  def protect_user_resources
    head status: :unauthorized unless @user == current_user
  end

  ##
  # Overrides default behavior from clearance
  def user_from_params
    email = user_params.delete(:email)
    handle = user_params.delete(:handle)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.handle = handle
      user.password = password
    end
  end

  ##
  # Overrides default behavior from clearance
  def url_after_create
    '/'
  end

  ##
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :handle, :password)
  end
end
