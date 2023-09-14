class GravesController < ApplicationController
  before_action :set_cemetery!
  before_action :set_grave!, only: %i[edit update destroy]

  def create
    # render plain: params
    @grave = @cemetery.graves.build grave_params

    if @grave.save
      flash[:success] = "Grave was successfully created."
      redirect_to cemetery_path(@cemetery)
    else
      @graves = @cemetery.graves.order created_at: :desc
      render 'cemeteries/show'
    end
  end

  def edit
  end

  def update
    if @grave.update(grave_params)
      redirect_to cemetery_url(@cemetery)
      flash[:success] = "Grave was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @grave.destroy
    flash[:success] = "Grave was successfully deleted."
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

# {"authenticity_token"=>"_8qoLpbCjT2CgMOeCo0HFeer1KjyioMCEkn4WeNFQf5U6zHjnrCr08mzO-L6Pim_8l_e0eKOaafFDSKDwOgYEA", 
# "grave"=>{"last_name"=>"", "first_name"=>"", "father_name"=>"", 
#           "birthday"=>"", "deathday"=>""}, 
#           "commit"=>"Submit Grave!", "controller"=>"graves", 
#           "action"=>"create", "cemetery_id"=>"1"}
