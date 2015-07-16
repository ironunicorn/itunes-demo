class AddPlaceToAlbum < ActiveRecord::Migration
  def change
  	add_column :albums, :place, :string, default: :studio, null: false
  end
end
