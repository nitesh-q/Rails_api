class Api::V1::ProductsController < ApplicationController
  def index
    @products=Product.all
    render json: @products,status:200
  end

  def show
    @product=Product.find(params[:id])
    if @product
      render json: @product
    else
      render json:{error: "not found"}
    end
  end

  def create
    @product=Product.new(
      name: params1[:name],
      brand: params[:product][:brand],
      price: params[:product][:price]
    )
    if @product.save
      render json:@product
    else render json:{error: "product not created"}
    end
  end

  #update 
  def update
    # @product=Product.find(params[:id])
    # @product.update(
    #   name: prod_params[:name],
    #   brand: prod_params[:brand],
    #   price: prod_params[:price]
    # )
    def update
      @product=Product.find(params[:id])
      @product.update(brand: params1[:brand],
        name: params1[:name],
        price: params1[:price] )
      # if @product.update(name: :name)
         render json:@product
      # else
      #   render json: @product.errors, status: :unprocessable_entity
      # end
    end
    
  end
  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    head :no_content

  end

  private
  def params1
    params.require(:product).permit([:name,:price,:brand])
  end
end
