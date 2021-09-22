class CashRegister

    attr_accessor :discount, :total, :last_transaction_price, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction_price = price * quantity
        self.total += self.last_transaction_price
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - self.total * discount / 100
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.items.pop
        self.total -= self.last_transaction_price
        self.total < 0 ? self.total = 0 : nil
    end
end