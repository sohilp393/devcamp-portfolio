class PortfoliosController < ApplicationController
  
  def index
    @portfolio_items = Portfolio.all
  end

  def show
    debugger
    @portfolio_item = Portfolio.find(params[:id])  
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

    def update
      @portfolio_item = Portfolio.find(params[:id])

      respond_to do |format|
        if @portfolio_item.update(params.require(:portfolio).permit(:title,:subtitle,:body))
          format.html { redirect_to portfolios_path, notice: 'The record successfully updated.'}
        else
          format.html { render :edit}
        end
      end
    end

    def destroy
      @portfolio_item = Portfolio.find(params[:id])

      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolios_url,notice: 'Record was desleted'}     
      end
    end

private
  def portfolio_params
      params.require(:portfolio).permit(:title,:subtitle,:body,:main_image,:thumb_image)
  end    
end
