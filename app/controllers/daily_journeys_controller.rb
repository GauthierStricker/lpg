class DailyJourneysController < ApplicationController
  # OUT OF SCOPE : Today and lock management vs. Weekly Prep

  # IMPORTANT : ADD PUNDIT PROTECTION
  # Before action
  before_action :set_hero
  # CRUD
  def index
  end

  def show
    # Check if the hero's user has a daily_journey for the queried date
    if @daily_journey = @hero.daily_journeys.find_by(date: params[:date])
    else
      show_today_journey
    end
  end

  def show_today_journey
    if @daily_journey = today_journey_exist?
    else
      initialize_today_journey
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # Specific Actions

  def lock
    #Change la value lock à true + Calculer les valeurs finales de daily Journey + update
  end

  # def cheatcode
    #Doit permettre de passer la valeur lock à false le temps de l'instance => Pas persisté en DB. => Valeur virtuelle de cheatcode + Attr_accessible ??
  # end
  # Private methods
  private

  def set_hero
    @hero = current_user.hero
  end

  def initialize_today_journey
    # To do : Add the lock mechanism
    # To do : Ajouter les instanciations des related objects
    # To do v2: Mettre dans un service object dédié
    @daily_journey = DailyJourney.new
    @daily_journey.hero = @hero
    @daily_journey.date = Date.today
    @daily_journey.locked = false

    @sleep_log = SleepLog.new
    @daily_journey.sleep_log = @sleep_log
    @sleep_log.date = @daily_journey.date

    if @daily_journey.save && @sleep_log.save
      show_today_journey
    else
      redirect_to hero_path
    end
  end

  def today_journey_exist?
  @hero.daily_journeys.find_by(date: Date.today)
  end

    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
  def daily_journey_params
    params.require(:daily_journey).permit(:date)
  end
end
