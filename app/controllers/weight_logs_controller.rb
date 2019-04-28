class WeightLogsController < ApplicationController
   #### IMPORTANT : ADD PUNDIT PROTECTION TO PREVENT OTHER USER TO MODIFY S !

  # Before actions

  # Actions
  # def index
    # Need to had 1:Many through
  # end

  # def show
    # Doesn't seem to exist
  # end

  # def new
    # Doesnt seem to exist. In Controller Daily journey. => Move in service
  # end

  # def create
    # Doesnt seem to exist. In Controller Daily journey. => Move in service
  # end


  def edit
    @weight_log = WeightLog.find(params[:id])
    today_daily_journey_is_locked?
  end

  def update
    @weight_log = WeightLog.find(params[:id])
    today_daily_journey_is_locked?

    @weight_log.update(weight_log_params)
    update_weight_variation
    if @weight_log.update(weight_log_params)
      # TO DO : It redirect with the id daily journey in the URL. To fix for lisibility.
      redirect_to daily_journey_path(@weight_log.daily_journey)
    else
      render :edit
    end
  end

  #Private
  private

  def today_daily_journey_is_locked?
    if @weight_log.daily_journey.locked == true
      redirect_back(fallback_location: hero_path)
    end
  end

  def update_weight_variation
    @weight_log.weight_variation = @weight_log.value - current_user.hero.weight
  end

  def weight_log_params
    params.require(:weight_log).permit(:value, :comment)
  end
end
