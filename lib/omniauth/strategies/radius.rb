require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Radius < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site => "https://account.radiusnetworks.com",
        :authorize_url => "https://account.radiusnetworks.com/auth/radius/authorize",
        :access_token_url => "https://account.radiusnetworks.com/auth/radius/access_token"
      }

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/radius/user.json?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end
