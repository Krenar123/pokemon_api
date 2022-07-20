# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

# Sidekiq sessions don't play well with Redis based sessions and Devise.
# See: https://github.com/redis-store/redis-rails/issues/34
# And: https://github.com/mperham/sidekiq/issues/2899
# And: https://github.com/mperham/sidekiq/wiki/Monitoring#sessions-being-lost
# Sidekiq::Web.set(:sessions, false)

# Back button
Sidekiq::Web.app_url = '/'

# --- Sidekiq cron ---
# Test here: https://crontab.guru/
hash = {
  'Import Pokemons from PokeApi' => {
    'class' => 'PokemonProxy::ToPokemonsJob',
    'cron' => '*/15 * * * *' # Run every 15 minutes
  },
  'Import Types from PokeApi' => {
    'class' => 'PokemonProxy::ToTypesJob',
    'cron' => '*/15 * * * *' # Run every 5 minutes
  }
}.freeze

# Load scheduled jobs unless in test environment
Sidekiq::Cron::Job.load_from_hash(hash) # if !Rails.env.test? && !Rails.env.development?
