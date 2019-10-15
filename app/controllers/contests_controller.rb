class ContestsController < ApplicationController
  before_action :auth, only: [:current_contest_selections]
  before_action :get_current_contest, only: [:current_contest, :current_contest_selections]

  def current_contest
    render json: @contest
  end

  def current_contest_selections
    songs = @contest.songs
    render json: songs, current_user: @current_user, contest: @contest
  end


  private
    # The last current active contest.
    def get_current_contest
      @contest = Contest.where("start_date < :today AND end_date >= :today", {today: Date.today}).order(created_at: :desc).first
    end

    def auth
      @current_user = User.first
    end

end
