# Changelog

## Version v0.4.2 (2024-03-18)

### Ops and CI/CD

- **deps:** bump aminueza/minio from 2.0.1 to 2.2.0 in /terraform (30994bf5)
- **deps:** bump hashicorp/kubernetes in /terraform (e54a4ad0)
- **deps:** bump cloudflare/cloudflare in /terraform (a5960b07)
- **deps:** bump 1Password/onepassword in /terraform (9ef9ce8b)

## Version v0.4.1 (2024-01-13)

### Ops and CI/CD

- **deps:** bump hashicorp/kubernetes in /terraform (20de1398)
- **deps:** bump 1Password/onepassword in /terraform (a3a548f2)
- **deps:** bump hashicorp/helm from 2.11.0 to 2.12.1 in /terraform (12875136)
- **deps:** bump cloudflare/cloudflare in /terraform (56d1ef2f)
- **deps:** bump aminueza/minio from 1.18.0 to 2.0.1 in /terraform (307a71a3)
- **deps:** bump 1Password/onepassword in /terraform (0bfe7029)
- **deps:** bump cloudflare/cloudflare in /terraform (f545a2a9)
- **deps:** bump cloudflare/cloudflare in /terraform (f2838211)

### Chores and tidying

- **zigbee2mqtt:** bump from 1.32.2 to 1.33.0 (5d74b533)

## Version v0.4.0 (2023-09-12)

### Features

- **influx:** add influxdb chart (e5f1a55b)

### Ops and CI/CD

- **deps:** bump cloudflare/cloudflare in /terraform (9ecf36a2)
- **deps:** bump aminueza/minio from 1.17.2 to 1.18.0 in /terraform (d2e8d41f)
- **deps:** bump cloudflare/cloudflare in /terraform (90b5b456)
- **deps:** bump hashicorp/helm from 2.10.1 to 2.11.0 in /terraform (6910ff07)

### Chores and tidying

- **longhorn:** pass Longhorn version to module; bump to 1.5.1 (848aaf76)

## Version v0.3.5 (2023-08-20)

### Ops and CI/CD

- **deps:** bump cloudflare/cloudflare in /terraform (8ab149dd)
- **deps:** bump hashicorp/kubernetes in /terraform (e424b78d)

### Chores and tidying

- **terraform:** loosen Terraform version requirement (0e0952ef)

## Version v0.3.4 (2023-08-20)

### Ops and CI/CD

- **deps:** bump aminueza/minio from 1.17.1 to 1.17.2 in /terraform (cbd9ff79)

### Other

- deps(zigbee2mqtt): bump to 1.32.2 (91f1165b)

## Version v0.3.3 (2023-07-31)

### Ops and CI/CD

- **deps:** bump aminueza/minio from 1.16.0 to 1.17.1 in /terraform (6d74fac0)
- **deps:** bump cloudflare/cloudflare in /terraform (04a5bc90)

## Version v0.3.2 (2023-07-22)

### Ops and CI/CD

- **deps:** bump aminueza/minio from 1.15.2 to 1.16.0 in /terraform (67c83fae)

### Chores and tidying

- **gitignore:** add .DS_Store (7f063924)
- **lefthook:** add terraform validate to pre-commit (0ac401e7)

### Other

- deps(terraform): bump from v1.5.0 to v1.5.3 (608d511b)

## Version v0.3.1 (2023-07-17)

### Ops and CI/CD

- **deps:** bump 1Password/onepassword in /terraform (7fe965a6)
- **deps:** bump cloudflare/cloudflare in /terraform (9d7c4497)
- **deps:** bump hashicorp/kubernetes in /terraform (a7a78c97)

## Version v0.3.0 (2023-06-27)

### Features

- **robusta:** added initial setup to cluster (cde99163)

### Fixes

- **lefthook:** fix outdated tflint argument format (ce9048cb)

### Tests

- test (1c45abc9)

### Chores and tidying

- **portainer:** remove portainer for now (4a38ebde)
- **longhorn:** change default replicas from 2 to 3 (6bd9a683)
- **robusta:** enable Prometheus stack (4570dc4c)
- **cloudflare:** add secrets; first attempt at a tunnel (53818654)
- **1password:** add tags to cloudflare items (32a90531)

### Other

- deps(zigbee2mqtt): update from 1.30.4 to 1.31.2 (1e9f50ed)

## Version v0.2.7 (2023-06-20)

### Ops and CI/CD

- **deps:** bump cloudflare/cloudflare in /terraform (fde71f24)

### Other

- deps(terraform): upgrade terraform to v1.5.0 (5853490d)

## Version v0.2.6 (2023-06-16)

### Chores and tidying

- **git:** ignore tfstate backup files (c5c44b35)
- **cloudflared:** override image version in chart (34576e5b)

## Version v0.2.5 (2023-06-15)

### Fixes

- **cloudflare:** read provider API token from correct field (46959d9d)

### Chores and tidying

- **zigbee2mqtt:** move Mosquitto host from template to terraform (824af69b)
- **cloudflare:** rework tunnel setup (05c1b522)

## Version v0.2.4 (2023-06-12)

### Ops and CI/CD

- add .env file with 1P Connect variable (de61332a)

### Chores and tidying

- **1password:** move vault management from variable to a data source (1a1a6d35)

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

