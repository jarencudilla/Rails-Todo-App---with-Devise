class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category

  def index
    @categories = current_user.categories.all if current_user != nil
  end

  private
  def get_category
    @categories = current_user.categories.all
  end
end
