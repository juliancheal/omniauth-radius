require 'omniauth-oauth2'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
end

module OmniAuth
  module Strategies
    class Radius < OmniAuth::Strategies::OAuth2

      def self.provider_url
        ENV['RADIUS_OAUTH_PROVIDER_URL'] || "https://account.radiusnetworks.com"
      end

      option :client_options, {
        :site => provider_url,
        :authorize_url => "#{provider_url}/auth/radius/authorize",
        :access_token_url => "#{provider_url}/auth/radius/access_token"
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
