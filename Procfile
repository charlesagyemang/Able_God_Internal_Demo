web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV && whenever --update-crontab
resque: QUEUE=* bundle exec rake resque:work