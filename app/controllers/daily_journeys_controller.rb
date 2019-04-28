class DailyJourneysController < ApplicationController
  # OUT OF SCOPE : Today and lock management vs. Weekly Prep

  # IMPORTANT : ADD PUNDIT PROTECTION
  # Before action
  before_action :set_hero
  # CRUD
  def index
  end

  def show
    #Check if the hero's user has a daily_journey for the queried date
    if @daily_journey = @hero.daily_journeys.find_by(date: params[:date])
    else
    #if not, redirect to the hero profil.
    #To modify => Should redirect to Today daily journey for hero
      redirect_to hero_path
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

  def today
    # Must be the root page when connecting
    # Fall back v.0 => Si le CRON n'a pas créé le daily journey d'ajd, on le créé + on lock celui d'hier
    # Fall back v.1 => Si le CRON n'a pas créé le daily journey d'ajd, on regarde le dernier existant, on créé tous ceux jusque ajd + on les lock
    # ou un before action ?
  end

  def lock
    #Change la value lock à true
  end

  # def cheatcode
    #Doit permettre de passer la valeur lock à false le temps de l'instance => Pas persisté en DB. => Valeur virtuelle de cheatcode + Attr_accessible ??
  # end
  # Private methods
  private

  def set_hero
    @hero = current_user.hero
  end
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
  def daily_journey_params
    params.require(:daily_journey).permit(:date)
  end
end
