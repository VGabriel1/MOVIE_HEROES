class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lists = List.all
  end

  def show
    @lists = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
