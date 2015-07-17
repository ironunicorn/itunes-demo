# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  track_id   :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :user, :track, :text, presence: true
  belongs_to :user
  belongs_to :track
end
