# frozen_string_literal: true

require 'spec_helper'
require 'omniauth-pentagon-oauth2'

describe OmniAuth::Strategies::PentagonOauth2 do
  subject(:strategy) do
    described_class.new(app, 'appid', 'secret', options).tap do |strategy|
      allow(strategy).to receive(:request).and_return(request)
    end
  end

  let(:request) { instance_double('Request', params: {}, cookies: {}, env: {}) }
  let(:app) { -> { [200, {}, ['Hello.']] } }
  let(:options) { {} }

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe '#name' do
    it 'has correct name' do
      expect(strategy.name).to eq(:pentagon_oauth2)
    end
  end

  describe '#client_options' do
    it 'has correct site' do
      expect(strategy.client.site).to eq('https://lvh.me')
    end

    context 'when overrides as strings' do
      let(:options) { { client_options: { 'site' => 'https://example.com' } } }

      it 'allows overriding the site' do
        expect(strategy.client.site).to eq('https://example.com')
      end
    end

    context 'when overrides as symbols' do
      let(:options) { { client_options: { site: 'https://example.com' } } }

      it 'allows overriding the site' do
        expect(strategy.client.site).to eq('https://example.com')
      end
    end
  end
end
