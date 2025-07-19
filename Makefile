ID        := org.freedesktop.Platform.GStreamer.openmpt
MANIFEST  := $(ID).yaml

BUILD_DIR := .flatpak/build
REPO_DIR  := .flatpak/repo

build:
	flatpak run org.flatpak.Builder --force-clean --install-deps-from=flathub $(BUILD_DIR) $(MANIFEST)

install: build
	flatpak run org.flatpak.Builder --force-clean --user --install $(BUILD_DIR) $(MANIFEST)

lint:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest $(MANIFEST)
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream $(ID).metainfo.xml

uninstall:
	flatpak uninstall --user $(ID)

clean:
	git clean -dfx .
