class Api::V1::PortfoliosController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]
  before_action :find_portfolio, only:[:show, :update, :destroy]

  def index
    @portfolios = Portfolio.all
    # byebug
    render json: @portfolios
  end

  def show
      render json: @portfolio
  end

  def create
    @portfolio = Portfolio.create(portfolio_params)

    if @resume.valid?
      render json: { portfolio: PortfolioSerializer.new(@portfolio) }, status: :created
    else
      # render json: { error: 'failed to create user' }, status: :not_acceptable
      render json: { error: @portfolio.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    # byebug
    if @portfolio.update(portfolio_params)
      render json: @portfolio
    else
      render json:{errors: @portfolio.errors.full_messages}
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit( :id, projects_attributes: [:title, :category, :image, :url])
  end

  def find_portfolio
    @portfolio = Portfolio.find_by_id(params[:id])
  end
end
