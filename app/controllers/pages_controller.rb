class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :authenticate_hero!, only: [:home]
  def home
  end
end
