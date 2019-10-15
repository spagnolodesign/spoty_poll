class ContestsController < ApplicationController
  before_action :auth, only: [:show_contest_selections, :show_contest_ranking]
  before_action :get_current_contest, only: [:show, :show_contest_selections, :show_contest_ranking]

  def show
    render json: @contest
  end

  def show_contest_selections
    songs = @contest.songs
    render json: songs, current_user: @current_user, contest: @contest
  end

  def show_contest_ranking
    selections = @contest.selections.order_by_most_votes
    render json: selections, current_user: @current_user, contest: @contest
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
