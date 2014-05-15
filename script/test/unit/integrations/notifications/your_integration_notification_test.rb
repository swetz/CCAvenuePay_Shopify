require 'test_helper'

class YourIntegrationNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @your_integration = YourIntegration::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @your_integration.complete?
    assert_equal "", @your_integration.status
    assert_equal "", @your_integration.transaction_id
    assert_equal "", @your_integration.item_id
    assert_equal "", @your_integration.gross
    assert_equal "", @your_integration.currency
    assert_equal "", @your_integration.received_at
    assert @your_integration.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @your_integration.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @your_integration.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end
end
