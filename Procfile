web: bin/rails server -p $PORT -e $RAILS_ENV
worker: bundle exec sidekiq -e $RAILS_ENV -C config/initializers/sidekiq.rb
