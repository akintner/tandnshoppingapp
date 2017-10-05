class AddCurrentPriceToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :current_price_per_unit, :float
  end
end
