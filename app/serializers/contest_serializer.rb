class ContestSerializer < ActiveModel::Serializer
  attributes :topic, :start_date, :end_date, :state
end
