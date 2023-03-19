class CreateRepositoryHolderTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :repository_holder_teams do |t|
      t.references :repository, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
