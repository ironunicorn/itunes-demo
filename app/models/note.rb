class Note < ActiveRecord::Base
  validates :user, :track, :text, presence: true
  belongs_to :user
  belongs_to :track
end
