class NameInterestsController < ApplicationController
  def create
    @name_interest = NameInterest.create(name_interest_params)
    if @name_interest.save
      redirect_to @name_interest
    else
      logger.warn "Unable to save name interest from: #{params.to_json}"
      redirect_to name_interests_path
    end
  end

  def show
    @name_interest = NameInterest.find(params[:id])
  end

  def index
  end

  private

  def name_interest_params
    params.require(:name_interest).permit(:email_address, :entered_name)
  end
end
