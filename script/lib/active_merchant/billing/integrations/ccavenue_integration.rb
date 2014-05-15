require File.dirname(__FILE__) + '/ccavenue_integration/helper.rb'
require File.dirname(__FILE__) + '/ccavenue_integration/notification.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module CcavenueIntegration

        mattr_accessor :service_url
        self.service_url = 'https://www.example.com'

        def self.notification(post)
          Notification.new(post)
        end
      end
    end
  end
end
