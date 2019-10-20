class ContestsController < ApplicationController
  before_action :auth, only: [:show_contest_selections, :show_contest_ranking, :add_song, :destroy_selection]
  before_action :get_current_contest

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

  def add_song
    spoty_api = SpotyAPI.new(params[:url])
    @song = spoty_api.search_and_create_byId
    @selection = @contest.selections.new song: @song, user: @current_user

    if @selection.save 
      if @song.save
        render json: @contest.selections, current_user: @current_user, contest: @contest
      else
        render json: @song.errors
      end
    else
        render json: @selection.errors
    end
  end

  def destroy_selection
    song_selections = @contest.songs.where(spotify_id: params[:id])

    if !song_selections.empty?
      is_by_current_user = (song_selections.first.selections.first.user_id == @current_user.id)
      if is_by_current_user
        song_selections.first.selections.destroy_all
        render json: { message: "The song was removed from the contest"}
      else
        render json: {
          status: "error", 
          code: 404, 
          message: "You can only remove the song you've added to the contest." }
      end
    else
      render json: {
        status: "error", 
        code: 404, 
        message: "No song found in contest with id: #{ params[:id] }" }
    end
  end


  private
    # Last current active contest.
    def get_current_contest
      @contest = Contest.where("start_date < :today AND end_date >= :today", {today: Date.today}).order(created_at: :desc).active.first
      if @contest.nil?
        render json: {status: "error", code: 404, message: "No active contest found" }
      end
    end

    def auth
      @current_user = User.first
    end

end
