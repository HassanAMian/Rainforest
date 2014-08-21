class ShoppingCart < ActiveRecord::Base
acts_as_shopping_cart

def tax_pct
    6.0
end
end
