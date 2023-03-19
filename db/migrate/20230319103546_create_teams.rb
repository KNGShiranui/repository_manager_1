class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
