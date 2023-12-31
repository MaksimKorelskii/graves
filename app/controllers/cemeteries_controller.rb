# frozen_string_literal: true

class CemeteriesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_cemetery, only: %i[show edit update destroy]
  before_action :authorize_cemetery!
  after_action :verify_authorized

  def index
    # @cemeteries = Cemetery.all
    @pagy, @cemeteries = pagy Cemetery.includes(:user).order(created_at: :desc)
    # @pagy, @cemeteries = pagy Cemetery.includes(:user).
    #         joins(:graves).
    #         select("cemeteries.*", 'COUNT("graves.id") AS graves_count').
    #         group('cemeteries.id')

    @cemeteries = @cemeteries.decorate
  end

  def show
    @grave = @cemetery.graves.build
    # @graves = @cemetery.graves.order created_at: :desc
    # @graves = Grave.where(cemetery_id: @cemetery).order(created_at: :desc).limit(2)
    @pagy, @graves = pagy @cemetery.graves.order created_at: :desc
  end

  def new
    @cemetery = Cemetery.new
  end

  def edit; end

  def create
    # render plain: params.to_yaml and return# Отрендерить текст объект params
    # @cemetery = Cemetery.new(cemetery_params)
    @cemetery = current_user.cemeteries.build cemetery_params

    if @cemetery.save
      redirect_to cemetery_url(@cemetery)
      flash[:success] = 'Cemetery was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cemetery.update(cemetery_params)
      redirect_to cemetery_url(@cemetery)
      flash[:success] = 'Cemetery was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cemetery.destroy

    flash[:success] = t('.success')
    redirect_to cemeteries_url
  end

  private

  def set_cemetery
    @cemetery = Cemetery.find(params[:id])
  end

  def cemetery_params
    params.require(:cemetery).permit(:title, :description)
    # params.fetch(:cemetery, {})
  end

  def authorize_cemetery!
    authorize(@cemetery || Cemetery)
  end
end
