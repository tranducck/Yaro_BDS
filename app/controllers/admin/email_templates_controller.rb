class Admin::EmailTemplatesController < ApplicationController
  before_action :admin_must_logged_in
  layout "admin"

  def new
    @template = EmailTemplate.new
  end

  def create
    @template = EmailTemplate.new template_params
    if @template.valid?
      @template.save
      flash[:success] = "Tạo template email thành công"
      redirect_to admin_email_templates_path
    else
      render "new"
    end
  end

  private
    def template_params
      params.require(:email_template).permit(:title, :content)
    end
end
