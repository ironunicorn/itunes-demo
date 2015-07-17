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

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
