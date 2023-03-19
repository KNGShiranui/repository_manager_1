class Diff < ApplicationRecord
  belongs_to :old_object, class_name: "Object", optional: true
  belongs_to :new_object, class_name: "Object", optional: true
end
