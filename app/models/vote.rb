class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :selection, counter_cache: true
end
