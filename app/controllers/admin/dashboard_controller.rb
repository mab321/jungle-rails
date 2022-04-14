class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_ADMIN_USERNAME'], password: ENV['AUTH_ADMIN_PASSWORD']
  def show
    #Display a count of how many products are in the database
    #Display a count of how many categories are in the database
    @count_products = Product.count 
    @count_categories = Category.count
  end
end
