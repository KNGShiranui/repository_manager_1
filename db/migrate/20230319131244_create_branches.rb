class CreateBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.references :repository, foreign_key: true
      t.references :parent, foreign_key: { to_table: :branches }
      t.timestamps
    end
  end
end