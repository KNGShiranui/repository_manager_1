class CreateDiffs < ActiveRecord::Migration[6.1]
  def change
    create_table :diffs do |t|
      t.references :old_file, foreign_key: { to_table: :files }
      t.references :new_file, foreign_key: { to_table: :files }
      t.text :diff_content

      t.timestamps
    end
  end
end
