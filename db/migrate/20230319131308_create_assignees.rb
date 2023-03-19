class CreateAssignees < ActiveRecord::Migration[6.1]
  def change
    create_table :assignees do |t|
      t.references :issue, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end