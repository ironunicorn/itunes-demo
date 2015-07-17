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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
