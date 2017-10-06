class ChangeOrderStatusToChannel < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :status
    add_column :orders, :channel, :integer, default: 0
  end
end
