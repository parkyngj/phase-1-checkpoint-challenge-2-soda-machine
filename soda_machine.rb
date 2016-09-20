class SodaMachine
  attr_reader :sodas, :cash

  def initialize(args = {})
    @sodas = args[:sodas]
    @cash = args[:cash]
  end

  def current_inventory_count
    @sodas.size
  end

  def find_soda(soda_brand)
    sold_soda = @sodas.find {|soda| soda.brand == soda_brand}
  end

  def sell(soda_brand)
    sold_soda = @sodas.find {|soda| soda.brand == soda_brand}
    return nil if sold_soda.nil?
    @cash += sold_soda.price
    @sodas.delete_at(@sodas.index(sold_soda))
  end
end