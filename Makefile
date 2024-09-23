# use host flatpak-builder, or run builder inside flatpak
BUILDER   := $(shell command -v flatpak-builder || echo flatpak run org.flatpak.Builder)

ID        := org.freedesktop.Platform.GStreamer.openmpt
MANIFEST  := $(ID).yaml

BUILD_DIR := .flatpak/build
REPO_DIR  := .flatpak/repo

build:
	$(BUILDER) --force-clean --install-deps-from=flathub $(BUILD_DIR) $(MANIFEST)

install: build
	$(BUILDER) --force-clean --user --install $(BUILD_DIR) $(MANIFEST)

uninstall:
	flatpak uninstall --user $(ID)

clean:
	git clean -dfx .
