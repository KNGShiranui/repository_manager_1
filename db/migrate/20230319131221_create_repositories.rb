class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.string :access_level
      t.timestamps
    end
  end
end