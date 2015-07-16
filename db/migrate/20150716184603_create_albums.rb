class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :band, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
