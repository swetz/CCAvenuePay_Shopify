require 'test_helper'

class CcavenueIntegrationModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def test_notification_method
    assert_instance_of CcavenueIntegration::Notification, CcavenueIntegration.notification('name=cody')
  end
end
