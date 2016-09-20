require_relative 'soda'

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
    soda_brand_ary[0]
  end

  def sell(soda_brand)
    soda_brand_ary = @sodas.select do |soda|
      soda.brand == soda_brand
    end

    soda_brand_ary

    return nil if soda_brand_ary.empty?
    sold_soda = soda_brand_ary[0]
    sold_soda_index = @sodas.index(sold_soda)
    @cash += sold_soda.price
    @sodas.delete_at(sold_soda_index)
  end

end

# pepsi = Soda.new(brand: 'Pepsi', price: 0.65)
# mountain_dew = Soda.new(brand: 'Mountain Dew', price: 0.75)
# coke_zero = Soda.new(brand: 'Coke Zero', price: 1.00)
# second_pepsi = Soda.new(brand: 'Pepsi', price: 0.65)

# soda_machine = SodaMachine.new(sodas: [pepsi, mountain_dew, coke_zero, second_pepsi], cash: 1.00)

#   p soda_machine.cash
#   p soda_machine.sell('Coke Zero')
#   p soda_machine.sodas
#   p soda_machine.cash