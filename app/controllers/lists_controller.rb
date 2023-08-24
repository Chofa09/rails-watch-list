class ListsController < ApplicationController
  before_action :set_lists, only: %i[index create]

  def index
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render 'lists/index', status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_lists
    @lists = List.all
  end
end
