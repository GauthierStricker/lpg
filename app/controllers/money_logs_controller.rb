class MoneyLogsController < ApplicationController
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
    @money_log = MoneyLog.find(params[:id])
    today_daily_journey_is_locked?
  end

  def update
    @money_log = MoneyLog.find(params[:id])
    today_daily_journey_is_locked?

    @money_log.update(money_log_params)
    update_balanced_money
    if @money_log.update(money_log_params)
      # TO DO : It redirect with the id daily journey in the URL. To fix for lisibility.
      redirect_to daily_journey_path(@money_log.daily_journey)
    else
      render :edit
    end
  end

  #Private
  private

  def today_daily_journey_is_locked?
    if @money_log.daily_journey.locked == true
      redirect_back(fallback_location: hero_path)
    end
  end

  def update_balanced_money
    @money_log.balanced_money = current_user.hero.total_money + @money_log.gained_money - @money_log.spent_money
  end

  def money_log_params
    params.require(:money_log).permit(:gained_money, :spent_money, :comment)
  end
end
