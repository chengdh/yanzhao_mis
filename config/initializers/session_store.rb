# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yanzhao-settlement_session',
  :secret      => '14cae28b8ccdf2d00737ef71a7c357113605daf4b85ce52b05e164f80cf3d45f9ba4e3397d5f7e207d0e24e12314c51f918b9ad67d1e65b0fab1be8e8653c118'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
