class CemeteriesController < ApplicationController
  before_action :set_cemetery, only: %i[ show edit update destroy ]

  def index
    @cemeteries = Cemetery.all
  end

  def show
  end

  def new
    @cemetery = Cemetery.new
  end

  def edit
  end

  def create
    # render plain: params # Отрендерить текст объект params
    @cemetery = Cemetery.new(cemetery_params)
    
    if @cemetery.save
      redirect_to cemetery_url(@cemetery)
      flash[:success] = "Cemetery was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cemetery.update(cemetery_params)
      redirect_to cemetery_url(@cemetery)
      flash[:success] = "Cemetery was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cemetery.destroy

    redirect_to cemeteries_url
    flash[:success] = "Cemetery was successfully destroyed."
  end

  private

  def set_cemetery
    @cemetery = Cemetery.find(params[:id])
  end

  def cemetery_params
    params.require(:cemetery).permit(:title, :description)
    # params.fetch(:cemetery, {})
  end
end
