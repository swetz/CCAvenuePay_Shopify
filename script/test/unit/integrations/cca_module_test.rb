require 'test_helper'

class CcaModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def test_notification_method
    assert_instance_of Cca::Notification, Cca.notification('name=cody')
  end
end
