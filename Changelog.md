# Changelog

## Version v0.2.3 (2023-06-11)

### Chores and tidying

- **zigbee2mqtt:** move network key into 1Password (d942d6a9)

## Version v0.2.2 (2023-06-11)

### Chores and tidying

- **gitignore:** ignore .env files (7f4544b1)

## Version v0.2.1 (2023-06-11)

### Ops and CI/CD

- **task:** Add Taskfile (525a9fa0)

## Version v0.2.0 (2023-06-06)

### Features

- **cloudflare:** add Cloudflare provider (0871061a)

### Ops and CI/CD

- **deps:** bump hashicorp/kubernetes in /terraform (71a0344b)
- **deps:** bump hashicorp/helm from 2.9.0 to 2.10.1 in /terraform (2612e0d4)

## Version v0.1.1 (2023-05-29)

### Chores and tidying

- **cloudflared:** rename Terraform resource for clarity (68422107)

## Version v0.1.0 (2023-05-28)

### Features

- **cloudflared:** enable module (56832199)
- **cloudflared:** create module (65081a6e)

## Version v0.0.2 (2023-05-27)

### Chores and tidying

- **grafana:** disable Grafana module for now (20d2ef42)
- **grafana:** bump helm chart from 6.50.0 to 6.56.6 (999a32eb)
- **nodered:** bump from 0.22.1 to 0.23.2 (974c6f92)
- **zigbee2mqtt:** Bump from 1.30.0 to 1.30.4 (fe0c46d2)

## Version v0.0.1 (2023-05-25)

### Fixes

- outdated array index reference (80d77eb6)

### Ops and CI/CD

- add Semanticore workflow (7e494abf)
- **deps:** bump hashicorp/kubernetes in /terraform (e95be74e)
- **deps:** bump aminueza/minio from 1.14.0 to 1.15.2 in /terraform (a17846e1)
- **deps:** bump hashicorp/kubernetes in /terraform (6d80a6a0)
- **deps:** bump aminueza/minio from 1.13.0 to 1.14.0 in /terraform (0741ad1e)
- **deps:** bump aminueza/minio from 1.12.0 to 1.13.0 in /terraform (053e6a82)
- **deps:** bump hashicorp/kubernetes in /terraform (5d0cdbae)
- **deps:** bump hashicorp/helm from 2.8.0 to 2.9.0 in /terraform (d4c9eb21)
- **deps:** bump hashicorp/kubernetes in /terraform (fa717170)

### Chores and tidying

- Update readme (7e1fc568)
- Update readme (b963df7c)
- Update readme (f37a2deb)
- Update readme (631f221e)
- Update zigbee2mqtt version (f948a897)

### Other

- minio: rename resources (554f6992)
- Shuffle .gitignore entries around a bit (48f1c37b)
- longhorn: remove deprecated storage class (a8d061e8)
- remove unused vars (40395c30)
- minio: test config of managed Longhorn (e2c51934)
- Add super-fancy ascii art (db41d895)
- minio: initial setup (7960104a)
- 1password: initial install (c13945e2)
- 1password: initial install (b1c3ad0c)
- longhorn: set daily backup to 02:00 (e4d0728e)
- terraform: update lockfile (dependabot didn't) (f4a95b88)
- nodered: get rid of it for now (3f1e6808)
- lefthook: move trivy to pre-push (bc4b9b6e)
- trivy: --quiet (21e825b6)
- influx: add WIP module (1158c027)
- add uptime-kuma, grafana (0e73ee76)
- add portainer module (05d84270)
- lefthook: move trivy config (5141cdd6)
- trivy: move config to trivy.yaml (fc720046)
- lefthook: switch from tfsec to trivy (1fe77f38)
- terraform: remove unused provider (a1b6b7ca)
- traefik: fix hardcoded dashboard hostname (c38f25d6)
- Nodes have been renamed (6cac6d3a)
- mosquitto: set type to LB (44601efa)
- add lefthook config (24484959)
- zigbee2mqtt: bump to version 1.30.0 (cc3dc458)
- Bump hashicorp/kubernetes from 2.16.1 to 2.17.0 in /terraform (900efba6)
- zigbee2mqtt: power plugs supported since v1.29.2 (6664a7d1)
- longhorn: adjust snapshots (e07e1f82)
- zigbee2mqtt: update to v1.29.2 (d142a8b9)
- longhorn: clean up daily snapshot config (b86c79e9)
- Tag tasks (17150365)
- Add basic lefthook config (c4a74342)
- Add Hajimari ingress config (c693460f)
- Add zigbee2mqtt (d258fff1)
- Use variable for domain name (b90f8a73)
- Switch Node-RED from deployment to helm release (50642726)
- Create Longhorn recurring snapshot job (e15af83b)
- Move NodeRED PVC config to module (554bec8e)
- Add whoami service for testing things (1925f80a)
- Add readme (6cd1ba22)
- Create dependabot.yml (1b242c53)
- Check in lockfile (64cebc21)
- Initial commit (004d44b8)

