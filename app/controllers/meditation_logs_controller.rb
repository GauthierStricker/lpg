class MeditationLogsController < ApplicationController
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
    @meditation_log = MeditationLog.find(params[:id])
    today_daily_journey_is_locked?
  end

  def update
    @meditation_log = MeditationLog.find(params[:id])
    today_daily_journey_is_locked?
    @meditation_log.update(meditation_log_params)
    if @meditation_log.update(meditation_log_params)
      # TO DO : It redirect with the id daily journey in the URL. To fix for lisibility.
      redirect_to daily_journey_path(@meditation_log.daily_journey)
    else
      render :edit
    end
  end

  #Private
  private

  def today_daily_journey_is_locked?
    if @meditation_log.daily_journey.locked == true
      redirect_back(fallback_location: hero_path)
    end
  end

  def meditation_log_params
    params.require(:meditation_log).permit(:duration, :done)
  end
end
