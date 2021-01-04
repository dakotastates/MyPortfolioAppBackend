class Api::V1::WorksController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update]
  before_action :find_work, only:[:show, :update, :destroy]

  def index
    @works = Work.all
    render json: @works
  end

  private

  def work_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:work).permit(:title)
  end

  def find_work
    @work= Work.find_by_id(params[:id])
  end
end
