require 'test_helper'

class CcavenueIntegrationNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @ccavenue_integration = CcavenueIntegration::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @ccavenue_integration.complete?
    assert_equal "", @ccavenue_integration.status
    assert_equal "", @ccavenue_integration.transaction_id
    assert_equal "", @ccavenue_integration.item_id
    assert_equal "", @ccavenue_integration.gross
    assert_equal "", @ccavenue_integration.currency
    assert_equal "", @ccavenue_integration.received_at
    assert @ccavenue_integration.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @ccavenue_integration.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @ccavenue_integration.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end
end
