class HerosController < ApplicationController
  # Before Actions
  skip_before_action :authenticate_hero!, only: [:new, :create]
  # CRUD

  def show
    @hero = current_user.hero
  end

  def new
    # If current user has already an hero, he's redirect to root
    if current_user.hero == nil
      @hero = current_user.build_hero
      render layout: "hero_onboarding"
    else
      redirect_to root_path
    end
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    if @hero.save
      redirect_to hero_path(@hero)
    else
      render :new
    end
  end

  def edit
    @hero = current_user.hero
  end

  def update
    @hero = Hero.find(params[:id])
    if @hero.update(hero_params)
      redirect_to hero_path(@hero)
    else
      render :edit
    end
  end

  def destroy
    @hero = current_user.hero
    @hero.destroy
    redirect_to new_hero_path
  end

  # Specific actions


  # Private methods
  private
    def hero_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
      params.require(:hero).permit(:name, :weight, :total_money, :avatar)
  end
end
