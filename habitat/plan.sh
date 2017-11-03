pkg_name=kube-spawn
pkg_origin=robertgzr
pkg_maintainer=
pkg_license=('apache2')
pkg_upstream_url=https://github.com/kinvolk/kube-spawn
pkg_scaffolding="core/scaffolding-go"
# pkg_deps=()
pkg_build_deps=(
	core/git
	core/dep
)
pkg_version() {
	git describe --tags --always --dirty
}

do_before() {
	update_pkg_version
	cd $GOPATH/src/localhost/user/kube-spawn || return
}
do_verify() {
	return 0
}
do_unpack() {
	return 0
}

do_prepare() {
	attach
	dep ensure -v
}

do_build() {
	go build -o cni-noop ./cmd/cni-noop
	go build -o cnispawn ./cmd/cnispawn
	go build -o kube-spawn-runc ./cmd/kube-spawn-runc
	go build -o kube-spawn \
		-ldflags "-X main.version=$(pkg_version)" \
		./cmd/kube-spawn
}
