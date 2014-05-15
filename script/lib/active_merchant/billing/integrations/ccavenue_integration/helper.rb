module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module CcavenueIntegration
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :account, ''
          mapping :amount, ''

          mapping :order, ''

          mapping :customer, :first_name => 'test',
                             :last_name  => 't',
                             :email      => 'xyz@gmail.com',
                             :phone      => ''

          mapping :billing_address, :city     => 'jaipur',
                                    :address1 => 'abc',
                                    :address2 => 'cde',
                                    :state    => 'rajasthan',
                                    :zip      => '302020',
                                    :country  => 'india'

          mapping :notify_url, ''
          mapping :return_url, ''
          mapping :cancel_return_url, ''
          mapping :description, ''
          mapping :tax, ''
          mapping :shipping, ''
        end
      end
    end
  end
end
