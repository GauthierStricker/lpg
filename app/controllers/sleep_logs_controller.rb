class SleepLogsController < ApplicationController
  #### IMPORTANT : ADD PUNDIT PROTECTION TO PREVENT OTHER USER TO MODIFY SLEEPLOG OF A HERO !

  #Before actions
  #Actions
  def index
    # Need to had 1:Many through
  end

  def show
    #Doesn't seem to exist
  end

  def new
    # Not sure it's usefull
    if @daily_journey.sleep_log == nil
      @sleep_log = @daily_journey.build_sleep_log
    else
      redirect_to daily_journey_today_path
    end
  end

  def create
    # Not sure it's usefull
    @sleep_log = Sleeplog.new(sleep_log_params)
    @sleep_log.daily_journey = @daily_journey
    @sleep_log.date = @daily_journey.date
    if @sleep_log.save
      redirect_to daily_journey_today_path
    else
      render :new
    end
  end

  def edit
    @sleep_log = SleepLog.find(params[:id])
    today_daily_journey_is_locked?
  end

  def update
    @sleep_log = SleepLog.find(params[:id])
    today_daily_journey_is_locked?

    @sleep_log.update(sleep_log_params)
    ## TO DO : FIX TIMEPICKER AND ENSURE NO DEFAULT VALUE IS PASSED IN FORMS
    update_sleep_duration
    if @sleep_log.update(sleep_log_params)
      update_sleep_duration
      # TO DO : It redirect with the id daily journey in the URL. To fix for lisibility.
      redirect_to daily_journey_path(@sleep_log.daily_journey)
    else
      render :edit
    end
  end

  def destroy
  end

  #Private
  private

  def today_daily_journey_is_locked?
    if @sleep_log.daily_journey.locked == true
      redirect_back(fallback_location: hero_path)
    end
  end

  def update_sleep_duration
    @sleep_log.sleep_duration = @sleep_log.end_time - @sleep_log.start_time
  end
  def sleep_log_params
    params.require(:sleep_log).permit(:start_time, :end_time, :comment)
  end
end
