class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def list_params
    params.require(:list).permit(:name, :genre)
  end
end
