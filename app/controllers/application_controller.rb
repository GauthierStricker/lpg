class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :authenticate_hero!

  protected
    def authenticate_hero!
      if current_user && current_user.hero == nil
        redirect_to new_hero_path
      end
    end
end
