# Cephalon

**Cephalon** is the infra-as-code repository for my home lab setup. Work in progress.

## Cluster installation

The cluster is based on [k3s](https://k3s.io/). This is a learning experience, so currently it is using a default installation with [k3sup](https://github.com/alexellis/k3sup) as the installer.

The installation assumes that you have set up the nodes to allow SSH access, to allow k3sup to perform the installation.

### Install server

`k3sup install --ip $SERVER_IP --user pi`

### Join nodes to cluster

`k3sup join --ip $IP --server-ip $SERVER_IP --user pi`

## Hardware

The cluster currently runs on three Raspberry Pis, and a Rock Pi 5B.

- leader-1: Raspberry Pi 4, 4Gi RAM
  - 240Gi SSD attached for Longhorn storage
- agent-1: Raspberry Pi 3B+, 1Gi RAM
  - [Zig-Star Stick v4](https://zig-star.com/projects/zigbee-stick-v4/) attached as a Zigbee control unit
  - 2Ti nVME stick for Longhorn storage
- agent-2: Raspberry Pi 3B+, 1Gi RAM
- agent-3: Rock Pi 5B, 8Gi RAM
  - 2Ti nVME stick for OS + Longhorn storage
