class Onetable < ApplicationRecord
  has_one :twotable, dependent: :destroy
  has_one :threetable, dependent: :destroy
end
