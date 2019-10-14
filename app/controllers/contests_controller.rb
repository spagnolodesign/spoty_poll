class ContestsController < ApplicationController
  before_action :get_current_contest, only: [:current_contest, :current_contest_selection]

  def current_contest
    render json: @contest
  end

  def current_contest_selection
  end


  private
    # The last current active contest.
    def get_current_contest
      @contest = Contest.where("start_date < :today AND end_date >= :today", {today: Date.today}).order(created_at: :desc).first
    end
end
