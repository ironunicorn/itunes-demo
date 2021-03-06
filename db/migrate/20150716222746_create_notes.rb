class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :track, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
