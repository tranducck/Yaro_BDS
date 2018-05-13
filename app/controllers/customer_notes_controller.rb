class CustomerNotesController < ApplicationController
  before_action :user_must_logged_in
  before_action :check_customer, only: [:index, :new]

  def index
    @notes = @customer.customer_notes.paginate(page: params[:page])
  end

  def new
    @note = CustomerNote.new
  end

  def create
    @note = CustomerNote.new note_params
    if @note.valid?
      @note.save
      flash[:success] = "Create customer note successfully"
      redirect_to customer_notes_path(customer_id: @note.customer_id)
    else
      render "new"
    end
  end

  def edit
    @note = CustomerNote.find params[:id]
  end

  def update
    @note = CustomerNote.find params[:id]
    if @note.update note_params
      flash[:success] = "Update successfully"
      redirect_to edit_customer_note_path(@note)
    else
      render "edit"
    end
  end

  private
    def note_params
      params.require(:customer_note).permit(:title, :content, :customer_id)
    end

    def check_customer
      @customer = Customer.find_by(id: params[:customer_id])
      render file: "public/404.html", status: 404, layout: false unless @customer
    end
end
