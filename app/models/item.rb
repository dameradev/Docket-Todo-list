class Item < ApplicationRecord
  enum stat: { uncomplete:0, complete:1}
  belongs_to :user

end
