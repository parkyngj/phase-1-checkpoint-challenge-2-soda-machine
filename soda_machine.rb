class SodaMachine
  attr_reader :sodas, :cash

  def initialize(args = {})
    @sodas = args[:sodas]
    @cash = args[:cash]
  end

  def current_inventory_count
    @sodas.length
  end

  def find_soda(soda_brand)
    soda_brand_ary = @sodas.select do |soda|
      soda.brand == soda_brand
    end

    # NOTE TO SELF: Don't need line 21 because if soda_brand_ary is empty, then calling for the 0th indexed element of soda_brand_ary, an empty array, will return nil anyway
    # return nil if soda_brand_ary.empty?
    soda_brand_ary.first
  end

  def sell(soda_brand)
    soda_brand_ary = @sodas.select do |soda|
      soda.brand == soda_brand
    end

    return nil if soda_brand_ary.empty?
    sold_soda = soda_brand_ary.first
    @cash += sold_soda.price
    @sodas.delete_at(@sodas.index(sold_soda))
  end

end