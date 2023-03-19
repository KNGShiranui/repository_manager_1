class CreateDiffs < ActiveRecord::Migration[6.1]
  def change
    create_table :diffs do |t|
      t.references :old_object, foreign_key: { to_table: :objects }
      t.references :new_object, foreign_key: { to_table: :objects }
      t.text :diff_content
      t.timestamps
    end
  end
end