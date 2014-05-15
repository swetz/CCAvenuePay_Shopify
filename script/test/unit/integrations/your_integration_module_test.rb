require 'test_helper'

class YourIntegrationModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def test_notification_method
    assert_instance_of YourIntegration::Notification, YourIntegration.notification('name=cody')
  end
end
