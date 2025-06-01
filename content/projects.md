# Projects

---

## Homelab

My homelab is powered by a Dell T420 tower server, running a full-featured
 cloud platform powered by OpenStack and Ceph.

Deployed on it are various self-hosted services, including a media server and
 home-automation platform. The infrastructure is entirely automated and
 deployed using DevOps tooling such as Terraform, Packer, Ansible, and GitLab
 CI. Backups and updates are automatic and run nightly.

The network consists of an OPNsense router/firewall, a single wireless access
 point, 3 managed switches, and 3 MoCA adapters that form an ethernet backbone
 using the in-wall coaxial wiring. There are several VLANs in play to provide
 logical segmentation and allow virtually unlimited freedom with networking in
 OpenStack.

This setup has served me for 2+ years now with the utmost reliability.

To find out more, see the [Docs](https://ralgar.gitlab.io/homelab) and the
 [GitLab Repository](https://gitlab.com/ralgar/homelab).
