require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Drip < OmniAuth::Strategies::OAuth2

      option :name, 'drip'

      option :access_token_options, {
        :header_format => 'Bearer %s',
        :param_name => 'token'
      }

      option :client_options, {
        :site => 'https://api.getdrip.com/v2',
        :authorize_url => 'https://www.getdrip.com/oauth/authorize',
        :token_url => 'https://www.getdrip.com/oauth/token'
      }

      uid { access_token.client.id }

      info do
        {
          email: user_info["users"][0]["email"]
        }
      end

      extra do
        {
          accounts: raw_info["accounts"]
        }
      end

      def user_info
        @user_info ||= JSON.parse(access_token.get("/user").body)
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get("/accounts").body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'drip', 'Drip'
