class Admin::DashboardController < ApplicationController
  def show
    # Display a count of how many products are in the database
    # Display a count of how many categories are in the database
    @productsAmount = Product.all
    @categoriesAmount = Category.all

  end
end
