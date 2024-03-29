require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module CcavenueIntegration
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          def complete?
            params['']
          end

          def item_id
            params['']
          end

          def transaction_id
            params['']
          end

          # When was this payment received by the client.
          def received_at
            params['']
          end

          def payer_email
            params['']
          end

          def receiver_email
            params['']
          end

          def security_key
            params['']
          end

          # the money amount we received in X.2 decimal.
          def gross
            params['']
          end

          # Was this a test transaction?
          def test?
            params[''] == 'test'
          end

          def status
            params['']
          end

          # Acknowledge the transaction to CcavenueIntegration. This method has to be called after a new
          # apc arrives. CcavenueIntegration will verify that all the information we received are correct and will return a
          # ok or a fail.
          #
          # Example:
          #
          #   def ipn
          #     notify = CcavenueIntegrationNotification.new(request.raw_post)
          #
          #     if notify.acknowledge
          #       ... process order ... if notify.complete?
          #     else
          #       ... log possible hacking attempt ...
          #     end
          def acknowledge(authcode = nil)
            payload = raw

            uri = URI.parse(CcavenueIntegration.notification_confirmation_url)

            request = Net::HTTP::Post.new(uri.path)

            request['Content-Length'] = "#{payload.size}"
            request['User-Agent'] = "Active Merchant -- http://activemerchant.org/"
            request['Content-Type'] = "application/x-www-form-urlencoded"

            http = Net::HTTP.new(uri.host, uri.port)
            http.verify_mode    = OpenSSL::SSL::VERIFY_NONE unless @ssl_strict
            http.use_ssl        = true

            response = http.request(request, payload)

            # Replace with the appropriate codes
            raise StandardError.new("Faulty CcavenueIntegration result: #{response.body}") unless ["AUTHORISED", "DECLINED"].include?(response.body)
            response.body == "AUTHORISED"
          end

          private

          # Take the posted data and move the relevant data into a hash
          def parse(post)
            @raw = post.to_s
            for line in @raw.split('&')
              key, value = *line.scan( %r{^([A-Za-z0-9_.-]+)\=(.*)$} ).flatten
              params[key] = CGI.unescape(value.to_s) if key.present?
            end
          end
        end
      end
    end
  end
end
