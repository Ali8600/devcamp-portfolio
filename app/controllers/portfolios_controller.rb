class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
  end

  def crickettipsshow
    @cricket_tips = Portfolio.cricketTips
    respond_to do |format|
      format.html # Render crickettipsshow.html.erb by default
    end
  end

  def new
    @portfolio_items = Portfolio.new
    #hardcoded version of running nested attributes
    # 3.time {@portfolio_items.tecnologies.build}
  end
  def show
    @portfolio_items = Portfolio.find(params[:id])
  end
  def edit
    @portfolio_items = Portfolio.find(params[:id])

  end
  def create
    @portfolio_items = Portfolio.new( params.require(:portfolio).permit(:title, :subtitle)) #, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    #look-up
    @portfolio_item = Portfolio.find(params[:id])
    #for deleting that item
    @portfolio_item.destroy
    respond_to do |format|
        format.html {redirect_to portfolios_path, notice: 'The record was successfully destroyed.'}
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
