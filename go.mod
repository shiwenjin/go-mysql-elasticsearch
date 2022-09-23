module github.com/siddontang/go-mysql-elasticsearch

go 1.12

//replace github.com/coreos/bbolt => go.etcd.io/bbolt v1.3.6
//replace github.com/etcd-io/gofail =>  go.etcd.io/gofail v1.3.6

require (
	github.com/BurntSushi/toml v1.2.0
	github.com/go-mysql-org/go-mysql v1.6.0
	github.com/juju/errors v1.0.0
	github.com/pingcap/check v0.0.0-20211026125417-57bd13f7b5f0
	github.com/prometheus/client_golang v1.13.0
	github.com/siddontang/go v0.0.0-20180604090527-bdc77568d726
	github.com/siddontang/go-log v0.0.0-20190221022429-1e957dd83bed
)
