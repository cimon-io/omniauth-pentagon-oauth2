# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    # Main class for Pentagon OAuth2 strategy.
    class PentagonOauth2 < OmniAuth::Strategies::OAuth2
      option :name, :pentagon_oauth2
      option :client_options, site: 'https://lvh.me'

      uid do
        raw_info['id']
      end

      info do
        {
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/userinfo.json').parsed
      end
    end
  end
end
