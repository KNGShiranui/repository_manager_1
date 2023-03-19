class CreateCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :commits do |t|
      t.string :message
      t.references :branch, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end