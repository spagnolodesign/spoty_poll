class SelectionSerializer < ActiveModel::Serializer
  belongs_to :user, key: "submitted_by"
  belongs_to :song
  has_many :votes do 
    object.votes.count
  end

end
