class Checkout
  
    attr_reader :contents
  
    def initialize(contents)
      @contents = contents
    end
  
    def submit(order)
      contents.each do |item_id, quantity|
        order.line_items.create(
          product_id: item_id.to_i, 
          quantity: quantity,
          current_price_per_unit: Product.find(item_id).cost
        )
      end
    end
  end