up:
	docker compose up -d

down:
	docker compose down -v

build:
	docker compose build --no-cache

rebuild: down build up

logs:
	docker compose logs -f

shell:
	docker compose exec web sh

composer:
	docker compose exec web composer $(filter-out $@,$(MAKECMDGOALS))

clean:
	docker system prune -af --volumes

ports:
	@echo "🔎 Ports potentiellement utilisés :"
	@for port in 80 443 3306 8080 5173; do \
		echo "⏳ Port $$port :"; \
		sudo lsof -i :$$port || echo "✅ Libre"; \
		echo "----------------------------"; \
	done