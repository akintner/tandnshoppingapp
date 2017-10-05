module ApplicationHelper

  def format_price_per_unit(item)
    "#{number_to_currency(price_for(item))} "
  end

  def price_for(item)
    return item.price_per_unit if item.class.to_s == "Item"
    item.current_price_per_unit
  end
end
