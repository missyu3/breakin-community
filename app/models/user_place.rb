class UserPlace < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place, optional: true
end
