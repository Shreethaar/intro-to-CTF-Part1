#!/bin/bash

prune_images() {
	echo "Pruning all unused Docker images..."
	docker image prune --all --force
}

prune_system() {
	echo "Pruning all unused Docker system resources..."
	docker system prune -a --force

}

prune_images
prune_system

echo "docker-cleanup done"
