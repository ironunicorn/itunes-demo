class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :album, index: true, foreign_key: true
      t.string :name, null: false
      t.boolean :bonus, null: false, default: false

      t.timestamps null: false
    end
  end
end
