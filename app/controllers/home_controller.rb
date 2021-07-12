class HomeController < ApplicationController
  def index
    @categories = current_user.categories.all if current_user != nil
  end
end
