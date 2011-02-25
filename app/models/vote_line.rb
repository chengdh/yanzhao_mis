class VoteLine < ActiveRecord::Base
  belongs_to :vote
  belongs_to :org
end
