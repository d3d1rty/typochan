##
# = PagesController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing pages.
class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  before_action :protect_admin_resources, only: %i[index]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:message] = 'Page was successfully created.'
      flash[:type] = 'success'
      redirect_to @page
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      flash[:message]= 'Page was successfully updated.'
      flash[:type] = 'success'
      redirect_to @page
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    flash[:message] = 'Board was successfully destroyed.'
    flash[:type] = 'success'
    redirect_to pages_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.friendly.find(params[:id])
  end

  ##
  # Protects against directory traversal
  def protect_admin_resources
    head status: :unauthorized unless current_user.admin?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:title, :body)
  end
end
