# frozen_string_literal: true

class GravesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_cemetery!
  before_action :set_grave!, only: %i[edit update destroy]

  def edit; end

  def create
    # render plain: params
    @grave = @cemetery.graves.build grave_params

    if @grave.save
      flash[:success] = 'Grave was successfully created.'
      redirect_to cemetery_path(@cemetery)
    else
      @pagy, @graves = pagy @cemetery.graves.order created_at: :desc
      render 'cemeteries/show'
    end
  end

  def update
    if @grave.update(grave_params)
      flash[:success] = 'Grave was successfully updated.'
      # redirect_to cemetery_url(@cemetery, anchor: "grave-#{@grave.id}")
      redirect_to cemetery_url(@cemetery, anchor: dom_id(@grave))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @grave.destroy
    flash[:success] = 'Grave was successfully deleted.'
    redirect_to cemetery_path(@cemetery)
  end

  private

  def set_cemetery!
    @cemetery = Cemetery.find params[:cemetery_id]
  end

  def set_grave!
    @grave = @cemetery.graves.find params[:id]
  end

  def grave_params
    params.require(:grave).permit(:last_name, :first_name, :father_name,
                                  :birthday, :deathday)
  end
end
