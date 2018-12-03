class Item < ApplicationRecord
  belongs_to :user
  def completed?
    !completed.blank?
  end
end
