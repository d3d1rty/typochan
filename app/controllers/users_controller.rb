##
# = UsersController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing user resources.
class UsersController < Clearance::UsersController
  # NOTE: Uncomment filters when controller actions are ready to be implemented.
  # before_action :set_user, only: %i[show edit update destroy]
  # before_action :require_login, only: %i[edit create update destroy]
  invisible_captcha only: %i[create]

  ##
  # GET /users/new
  def new
    @user = User.new
  end

  ##
  # GET /users/:user_id
  # NOTE: not implemented yet.
  # def show; end

  ##
  # GET /users/:user_id/edit
  # NOTE: not implemented yet.
  # def edit; end

  ##
  # POST /users
  def create
    @user = User.create(user_params)
    if @user.save
      sign_in @user
      flash[:message] = 'Account creation successful.'
      flash[:type] = 'success'
      redirect_to url_after_create
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to sign_up_path
    end
  end

  ##
  # PATCH/PUT /users/:user_id
  # NOTE: not implemented yet.
  # def update
  #   if @user.update(user_params)
  #     flash[:message] = 'User information was successfully updated.'
  #     flash[:type] = 'success'
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end

  ##
  # DELETE /users/:user_id/
  # NOTE: not implemented yet.
  # def destroy
  #   @user.destroy
  #   flash[:message] = 'User account was successfully deleted.'
  #   flash[:type] = 'success'
  #   redirect_to home_path
  # end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
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
