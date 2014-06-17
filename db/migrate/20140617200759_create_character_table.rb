class CreateCharacterTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :title, null: false
      t.string :network
    end

    add_index :television_shows, [:title, :network], unique: true
  end
end
