# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( customers.css )
Rails.application.config.assets.precompile += %w( materials.css )
Rails.application.config.assets.precompile += %w( productions.css )
Rails.application.config.assets.precompile += %w( orders.css )
Rails.application.config.assets.precompile += %w( orderdetails.css )
Rails.application.config.assets.precompile += %w( promotions.css )

Rails.application.config.assets.precompile += %w( welcome.js )
Rails.application.config.assets.precompile += %w( customers.js )
Rails.application.config.assets.precompile += %w( materials.js )
Rails.application.config.assets.precompile += %w( productions.js )
Rails.application.config.assets.precompile += %w( orders.js )
Rails.application.config.assets.precompile += %w( orderdetails.js )
Rails.application.config.assets.precompile += %w( promotions.js )