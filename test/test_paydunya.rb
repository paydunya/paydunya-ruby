require 'test/unit'
require 'paydunya'

class TestPaydunya < Test::Unit::TestCase
  def test_checkout_invoice_items
    invoice = Paydunya::Checkout::Invoice.new
    invoice.add_item("Article 1", 1, 1000, 1000, "Description optionnelle")
    invoice.add_item("Article 2", 5, 5000, 25000)
    invoice.total_amount = 26000
    invoice.description = "Unit::Test Invoice from Ruby lang"
    assert_instance_of(Hash, invoice.get_items)
    assert_equal(2, invoice.get_items.size)
    assert_instance_of(Hash, invoice.get_items[:item_0])
    assert_equal(5, invoice.get_items[:item_0].size)
  end
end