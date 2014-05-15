require 'test_helper'

class CcaNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @cca = Cca::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @cca.complete?
    assert_equal "", @cca.status
    assert_equal "", @cca.transaction_id
    assert_equal "", @cca.item_id
    assert_equal "", @cca.gross
    assert_equal "", @cca.currency
    assert_equal "", @cca.received_at
    assert @cca.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @cca.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @cca.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end
end
