class WebController < ApplicationController
  def index
    if sort_params.present?
      @categry = Category.request_category(sort_params[:sort_category])
      @products = Product.sort_products(sort_params, params[:page])
    elsif params[:category].present?
      @categry = Category.request_category(params[:category])
      @products = Product.catedory_products(@categry, params[:page])
    else
      @products = Product.display_list(params[:page])
    end

    @major_category_names = Category.major_categories
    @categories = Category.all
  end  

  private
    def sort_params
      params.permit(:sort, :sort_category)
    end
end
