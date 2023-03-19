class Fileobject < ApplicationRecord
  belongs_to :branch
  has_many :diffs_as_old_file, class_name: 'Diff', foreign_key: 'old_file_id', dependent: :destroy
  has_many :diffs_as_new_file, class_name: 'Diff', foreign_key: 'new_file_id', dependent: :destroy
end