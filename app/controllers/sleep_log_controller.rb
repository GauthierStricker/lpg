class SleepLogController < ApplicationController
  #Before actions

  #Actions
  def index
    # Need to had 1:Many through
  end

  def show
    #Doesn't seem to exist
  end

  def new
    if @daily_journey.sleep_log == nil
      @sleep_log = @daily_journey.build_sleep_log
    else
      redirect_to daily_journey_today_path
    end
  end

  def create
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
    @sleep_log = @daily_journey.sleep_log
  end

  def update
     @sleep_log = @daily_journey.sleep_log
    if @sleep_log.update(sleep_log_params)
      update_sleep_duration
      redirect_to daily_journey_path(@daily_journey)
    else
      render :edit
    end
  end

  def destroy
  end

  #Private
  private

  def update_sleep_duration
    @sleep_log.sleep_duration = end_time - start_time
  end
  def sleep_log_params
    params.require(:sleep_log).permit(:start_time, :end_time, :comment)
  end
end
