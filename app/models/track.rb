# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  name       :string           not null
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lyrics     :text
#

class Track < ActiveRecord::Base
  validates :name, :album, presence: true
  
  belongs_to :album
  has_many :notes, dependent: :destroy
end
