class ActivityLogsController < ApplicationController
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
    @activity_log = ActivityLog.find(params[:id])
    today_daily_journey_is_locked?
  end

  def update
    @activity_log = ActivityLog.find(params[:id])
    today_daily_journey_is_locked?

    if @activity_log.update(activity_log_params)
      # TO DO : It redirect with the id daily journey in the URL. To fix for lisibility.
      redirect_to daily_journey_path(@activity_log.daily_journey)
    else
      render :edit
    end
  end

  #Private
  private

  def today_daily_journey_is_locked?
    if @activity_log.daily_journey.locked == true
      redirect_back(fallback_location: hero_path)
    end
  end

  def destroy_old_proof_at_update
    # Si la proof est maj, Detruire l'ancien media de cloudinary
  end

  def activity_log_params
    params.require(:activity_log).permit(:done, :spent_klr, :comment, :proof)
  end
end
