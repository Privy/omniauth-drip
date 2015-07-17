require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Drip < OmniAuth::Strategies::OAuth2

      option :name, 'drip'

      option :client_options, {
        :site => 'https://api.getdrip.com/v2',
        :authorize_url => 'https://www.getdrip.com/oauth/authorize',
        :token_url => 'https://www.getdrip.com/oauth/token'
      }
    end
  end
end

OmniAuth.config.add_camelization 'drip', 'Drip'
