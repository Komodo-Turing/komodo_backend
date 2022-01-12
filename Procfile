web: bin/rails server -p $PORT -e $RAILS_ENV
timerworker: bundle exec sidekiq -c 2
worker: bundle exec rake jobs:work