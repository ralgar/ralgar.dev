---
title: "On Reflection and Amplification Attacks"
date: 2025-05-09
draft: false
toc: false
images:
tags:
  - cybersecurity
  - networking
---

---

## Introduction

A **reflection attack** is a type of **Denial-of-Service (DoS)** attack in
 which an attacker spoofs the victim’s IP address and sends a large volume of
 requests to one or more third-party services. The third parties then respond
 to the victim, overwhelming them with traffic.

Due to source IP spoofing, reflection attacks are extremely difficult to
 mitigate, and nearly impossible for victims or third parties to trace without
 significant coordination from telecommunications operators and government
 agencies.

---

## Amplification

An **amplification attack** is a type of reflection attack in which the
 response data is significantly larger than the initial request. For example,
 a small DNS query of 60 bytes can generate a response of 4 KiB or more,
 resulting in a substantial amount of data being directed at the victim.

Common services that can be leveraged for amplification attacks include DNS,
 NTP, and memcached, with the latter being capable of amplification factors as
 high as 51,000x.

---

## Mitigation

There are several paths to mitigation, and it’s a shared responsibility. One
 could argue that internet service providers have an obligation to prevent
 spoofing by implementing ingress filtering – the detection and dropping of
 packets where the source IP does not match one of their networks. If every
 major provider adopted this approach, it could effectively eliminate
 spoofing-based attacks.

Additionally, IT engineers worldwide should ensure their services are properly
 configured. For example, there is absolutely no valid reason to have a
 publicly-accessible memcached instance – this is pure negligence. Similarly,
 it is wise to evaluate whether you truly need an open DNS resolver.
 Personally, although I could operate as the public, authoritative nameserver
 for my domains, I delegate that task to Cloudflare and only provide
 authoritative resolution within my own private network.

The reality for most individuals or small to medium-sized businesses hosting
 internet services is that their mitigation options are somewhat limited. They
 simply don’t have the network capacity to effectively mitigate a sophisticated
 amplified reflection attack from a botnet or fleet of rented servers. While
 certain measures, such as restricting unwanted traffic at the firewall level,
 can be helpful, the best course of action is to put services behind commercial
 DDoS protection, such as Cloudflare DDoS protection or AWS Shield. These
 organizations leverage advanced detection techniques and Anycast routing,
 along with substantial network capacity, to effectively absorb and mitigate
 DDoS attacks, allowing operations to continue as normal.

---

## Conclusion

Reflection and amplification attacks are a significant threat to online
 services, exploiting publicly-accessible servers in order to overwhelm targets
 with malicious traffic. By combining source IP spoofing with services capable
 of disproportionate request/response sizes, attackers can effectively launch
 devastating DDoS attacks with minimal resources. Mitigating these attacks is
 best done with a multi-layered approach, including ingress filtering at the
 ISP level, securing vulnerable services, and leveraging advanced DDoS
 protection solutions that can absorb and distribute attack traffic across
 global networks.
