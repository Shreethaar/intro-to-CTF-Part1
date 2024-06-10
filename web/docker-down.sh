#!/bin/bash
docker_compose_down_all() {
    echo "Bringing down all Docker Compose projects..."
    find / -type f -name 'docker-compose.yml' -print0 | while IFS= read -r -d '' file; do
        dir=$(dirname "$file")
        echo "Bringing down Docker Compose project in directory: $dir"
        (cd "$dir" && docker-compose down)
    done

    echo "All Docker Compose projects have been brought down."
}

docker_compose_down_all

echo "Docker Compose cleanup completed"


