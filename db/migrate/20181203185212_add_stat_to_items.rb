class AddStatToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :stat, :integer, default:0
  end
end
