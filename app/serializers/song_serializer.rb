class SongSerializer < ActiveModel::Serializer
  attributes :title, :album, :artist, :album_cover, :spotify_id, :length_ms, :is_voted_by_me

  def is_voted_by_me      
      user = instance_options[:current_user]
      contest  = instance_options[:contest]
      voted = []
      contest.selections.where(song: object).first.votes.each do |vote|
        voted << (vote.user_id == user.id)
      end
      # User vote song in contest selection ?
      voted.include? true
  end
end
