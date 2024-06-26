build:
	docker-compose build

up:
	docker-compose up

stop:
	docker-compose stop

down:
	docker-compose down

bundle:
	docker-compose run --rm app bundle exec bundle install

console:
	docker-compose run --rm app bundle exec rails c

reinstall:
	docker-compose run --rm app bundle exec rails db:reinstall

rubocop:
	docker-compose run --rm app bundle exec rubocop $(path)

annotate:
	docker-compose run --rm app bundle exec annotate

erd:
	docker-compose run --rm app bundle exec rails mermaid_erd

routes:
	docker-compose run --rm app bundle exec rails routes

rspec:
	docker-compose run --rm app bundle exec rspec $(path)

bash:
	docker-compose run --rm app bash

admin:
	docker-compose run --rm app bundle exec rails generate active_admin:resource $(model)

credentials:
	docker-compose run --rm -e EDITOR="vim" bin/rails credentials:edit --environment $(env)
