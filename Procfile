web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV & QUEUE=* bundle exec rake resque:work & wait -n;
