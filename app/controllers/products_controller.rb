class ProductsController < ApplicationController
  # before_action :authenticate_admin, except: [:index, :show]
  
  def index    
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def create
    # im sending image_url in params but it's not getting saved in the db    
    # look up supplier id based on name    
    
    @product = Product.new(
      name: params[:name], 
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.save!
      # THIS IS NOT CRITICAL FEEL FREE TO IGNORE
      @image = Image.new(
        url: params[:image_url],
        product_id: @product.id
      )
      @image.save!
      render :show
    
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
