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
    if params[:date]
      queried_date = Date.parse(params[:date])
      if @daily_journey = @hero.daily_journeys.find_by(date: queried_date)
      else show_today_journey
      end
    elsif params[:id] = "today"
      show_today_journey
    elsif @daily_journey = @hero.daily_journeys.find(params[:id])
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

  #def new
  #end

  #def create
  #end

  #def edit
  #end

  #def update
  #end

  #def destroy
  #end

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

  def lock_today_journey
    # To do : Add the lock mechanism with calculation of daily journey performance, and update on hero charac
  end

  def initialize_today_journey
    # To do : Ajouter les instanciations des related objects
    # To do v2: Mettre dans un service object dédié
    # To Do v3 : Fallback si un objet à disparu, pour ne pas avoir l'erreur de page

    # Instanciation of Daily Journey for today
    @daily_journey = DailyJourney.new
    @daily_journey.hero = @hero
    @daily_journey.date = Date.today
    @daily_journey.locked = false

    # Instanciation of Sleeplog
    @sleep_log = SleepLog.new
    @daily_journey.sleep_log = @sleep_log
    @sleep_log.date = @daily_journey.date

    # Instanciation of WeightLog
    @weight_log = WeightLog.new
    @daily_journey.weight_log = @weight_log
    @weight_log.date = @daily_journey.date
    @weight_log.value = @hero.weight

    # Instanciation of ActivityLog
    @activity_log = ActivityLog.new
    @daily_journey.activity_log = @activity_log
    @activity_log.date = @daily_journey.date
    @activity_log.done = false
    @activity_log.spent_klr = 0.0

    # Instanciation of MoneyLog
    @money_log = MoneyLog.new
    @daily_journey.money_log = @money_log
    @money_log.date = @daily_journey.date
    @money_log.gained_money = 0.0
    @money_log.spent_money = 0.0

    # Instanciation of MoodLog
    @mood_log = MoodLog.new
    @daily_journey.mood_log = @mood_log
    @mood_log.date = @daily_journey.date

    # Instanciation of MeditationLog
    @meditation_log = MeditationLog.new
    @daily_journey.meditation_log = @meditation_log
    @meditation_log.date = @daily_journey.date
    @meditation_log.done = false

    # Validation and Redirection
    if @daily_journey.save && @sleep_log.save && @weight_log.save && @activity_log.save && @mood_log.save && @meditation_log.save
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
