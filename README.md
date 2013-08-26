# Omniauth::Radius

Official OmniAuth strategy for Radius Networks

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-radius'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-radius

# OmniAuth Radius

This is the official OmniAuth strategy for authenticating to Radius Networks
Account Server. To use it, you'll need to get an OAuth2 Application ID and Secret.

## Basic Usage

    use OmniAuth::Builder do
      provider :raidus, ENV['OAUTH_KEY'], ENV['OAUTH_SECRET']
    end

## Alternate Server Usage

    provider :raidus, ENV['OAUTH_KEY'], ENV['OAUTH_SECRET'],
        {
          :client_options => {
            :site => 'http://localhost:3000',
            :authorize_url => 'http://localhost:3000/login/oauth/authorize',
            :token_url => 'http://localhost:3000/login/oauth/access_token',
          }
        }

