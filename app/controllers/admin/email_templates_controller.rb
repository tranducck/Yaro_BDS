class Admin::EmailTemplatesController < ApplicationController
  before_action :admin_must_logged_in
  layout "admin"

  def index
    @templates = EmailTemplate.paginate(page: params[:page])
  end

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

  def edit
    @template = EmailTemplate.find(params[:id])
  end

  def update
    @template = EmailTemplate.find(params[:id])
    if @template.update template_params
      flash[:success] = "Cập nhật thành công"
      redirect_to edit_admin_email_template_path(@template)
    else
      render "edit"
    end
  end

  private
    def template_params
      params.require(:email_template).permit(:title, :content)
    end
end
