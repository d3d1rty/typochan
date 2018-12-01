class PreviewController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :preview

  ##
  # POST /preview
  def preview
    @text = preview_params[:text]
    render :preview, layout: false
  end

  private

  ##
  # Processes parameters for board requests.
  def preview_params
    params.require(:preview).permit(:text)
  end
end
