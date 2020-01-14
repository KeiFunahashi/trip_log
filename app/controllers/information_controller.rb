class InformationController < ApplicationController
  def new
    @information = Information.new
  end
  def create
    Information.create(information_params)
  end
def show
  @information = Information.find(params[:id])
end
  private
  def information_params
    params.require(:information).permit(:infimage,:inftitle, :inftext, :prefecture)
  end
end
