class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.references :repository, foreign_key: true
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
