class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all

    if params[:query].present?
      @lists = @lists.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "lists/list", locals: {lists: @lists}, formats: [:html] }
    end
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.save
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to dashboard_path
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :genre)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
