package script

const RktletServicePath = "/etc/systemd/system/rktlet.service"

const RktletService = `[Unit]
Description=rktlet: The rkt implementation of a Kubernetes Container Runtime
Documentation=https://github.com/kubernetes-incubator/rktlet/tree/master/docs

[Service]
ExecStart=/usr/bin/rktlet --net=weave
Restart=always
StartLimitInterval=0
RestartSec=10

[Install]
WantedBy=multi-user.target
`
