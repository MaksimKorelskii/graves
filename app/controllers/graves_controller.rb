# frozen_string_literal: true

class GravesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cemetery!
  before_action :set_grave!, only: %i[edit update destroy]
  before_action :authorize_grave!
  after_action :verify_authorized

  include ActionView::RecordIdentifier

  def edit; end

  def create
    # render plain: params
    @grave = @cemetery.graves.build(grave_create_params)

    if @grave.save
      flash[:success] = 'Grave was successfully created.'
      redirect_to cemetery_path(@cemetery)
    else
      @pagy, @graves = pagy @cemetery.graves.order created_at: :desc
      render 'cemeteries/show'
    end
  end

  def update
    if @grave.update(grave_update_params)
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

  def grave_create_params
    params.require(:grave).permit(:last_name, :first_name, :father_name,
                                  :birthday, :deathday).merge(user: current_user)
  end

  def grave_update_params
    params.require(:grave).permit(:last_name, :first_name, :father_name,
                                  :birthday, :deathday)
  end

  def authorize_grave!
    authorize(@grave || Grave)
  end
end
