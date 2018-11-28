##
# = PagesController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing pages.
class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  before_action :protect_admin_resources, only: :index

  ##
  # GET /pages
  def index
    @page_title = 'Manage Pages'
    @pages = Page.all
  end

  ##
  # GET /pages/:page_id
  def show
    @page_title = @page.title
  end

  ##
  # GET /pages/new
  def new
    @page_title = 'New Page'
    @page = Page.new
  end

  ##
  # GET /pages/:page_id/edit
  def edit
    @page_title = 'Edit Page'
  end

  ##
  # POST /pages
  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:message] = 'Page was successfully created.'
      flash[:type] = 'success'
      redirect_to @page
    else
      flash[:errors] = @page.errors.full_messages
      redirect_to new_page_path
    end
  end

  ##
  # PATCH/PUT /pages/:page_id
  def update
    if @page.update(page_params)
      flash[:message]= 'Page was successfully updated.'
      flash[:type] = 'success'
      redirect_to @page
    else
      flash[:errors] = @page.errors.full_messages
      redirect_to edit_page_path(@page)
    end
  end

  ##
  # DELETE /pages/:page_id
  def destroy
    @page.destroy
    flash[:message] = 'Board was successfully destroyed.'
    flash[:type] = 'success'
    redirect_to pages_url
  end

  private

  ##
  # Sets page for an action.
  def set_page
    @page = Page.friendly.find(params[:id])
  end

  ##
  # Processes parameters for page requests.
  def page_params
    params.require(:page).permit(:title, :body, :priority)
  end
end
