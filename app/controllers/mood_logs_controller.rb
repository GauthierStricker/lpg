class MoodLogsController < ApplicationController
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
    @mood_log = MoodLog.find(params[:id])
    today_daily_journey_is_locked?
  end

  def update
    @mood_log = MoodLog.find(params[:id])
    today_daily_journey_is_locked?
    #TO Do : Add protection on back for min and max value
    if @mood_log.update(mood_log_params)
      # TO DO : It redirect with the id daily journey in the URL. To fix for lisibility.
      redirect_to daily_journey_path(@mood_log.daily_journey)
    else
      render :edit
    end
  end

  #Private
  private

  def today_daily_journey_is_locked?
    if @mood_log.daily_journey.locked == true
      redirect_back(fallback_location: hero_path)
    end
  end

  def mood_log_params
    params.require(:mood_log).permit(:morning_value, :evening_value)
  end
end
