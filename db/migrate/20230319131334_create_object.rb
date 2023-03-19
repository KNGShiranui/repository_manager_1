class CreateObject < ActiveRecord::Migration[6.1]
  def change
    create_table :objects do |t|
      t.references :branch, foreign_key: true
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end