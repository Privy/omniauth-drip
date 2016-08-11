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
        :site => 'https://api.getdrip.com',
        :authorize_url => 'https://www.getdrip.com/oauth/authorize',
        :token_url => 'https://www.getdrip.com/oauth/token'
      }

      uid { user_info["users"][0]["email"] }

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
        @user_info ||= JSON.parse(access_token.get("/v2/user").body)
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get("/v2/accounts").body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'drip', 'Drip'
