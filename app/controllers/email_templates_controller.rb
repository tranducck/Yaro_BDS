class EmailTemplatesController < ApplicationController
  before_action :user_must_logged_in

  def index
    render json: {
      error: "success",
      data: EmailTemplate.all
    }, status: 200
  end
end
