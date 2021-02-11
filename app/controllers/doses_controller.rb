class DosesController < ApplicationController
  def new
    @dose = Dose.new # needed to instantiate the form_for
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
  	@cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to new_cocktail_dose_path
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private 

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
