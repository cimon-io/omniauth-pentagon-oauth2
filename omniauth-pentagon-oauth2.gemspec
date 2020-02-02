# frozen_string_literal: true

require_relative 'lib/omniauth/pentagon_oauth2/version'

Gem::Specification.new do |spec|
  spec.name        = 'omniauth-pentagon-oauth2'
  spec.version     = OmniAuth::PentagonOauth2::VERSION
  spec.authors     = ['Sergey Konev']
  spec.email       = ['sergey@cimon.io']

  spec.summary     = 'A custom Pentagon OAuth2 strategy for OmniAuth 1.x.'
  spec.description = 'A custom Pentagon OAuth2 strategy for OmniAuth 1.x.'
  spec.homepage    = 'https://github.com/cimon-io/omniauth-pentagon-oauth2'
  spec.license     = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.3')

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth', '~> 1.9'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.6'

  spec.add_development_dependency 'bundler-audit', '~> 0.6.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.79'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.37'
end
