docker-run:
	podman run -it --rm $$(podman build -q .)
