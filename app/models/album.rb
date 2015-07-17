# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place      :string           default("studio"), not null
#

class Album < ActiveRecord::Base
	validates :title, :band, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
