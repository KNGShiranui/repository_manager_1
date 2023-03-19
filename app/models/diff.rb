class Diff < ApplicationRecord
  belongs_to :old_file, class_name: 'File', optional: true
  belongs_to :new_file, class_name: 'File', optional: true
end
