GOROOT_DIR=/usr/local/goroot
GOVERSION=$(shell $(GOROOT_DIR)/bin/go version | { read _ _ v _; echo $$v; })


goversion:
	@echo $(GOVERSION)

all: clean copy package

package:
	@echo "Packaging..."
	cd dist/go && rm -rf .DS_Store .git* go.env
	cd dist && tar -zcf "$(GOVERSION)-darwin-high-sierra.tar.gz" -C "." "go"

clean:
	@echo "Cleaning..."
	rm -rf dist

copy:
	@echo "Copying..."
	mkdir -p dist
	cd dist && cp -Rf $(GOROOT_DIR) ./go
	

.PHONY: goversion all package clean copy
