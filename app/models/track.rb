class Track < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :album
  has_many :notes, dependent: :destroy
end
