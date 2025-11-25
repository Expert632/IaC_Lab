## 🔹 Action Plan for Terraform / AWS Vulnerabilities

| Vulnerability                                           | Level     | Responsible                | Action to Take                                                                       |
| ------------------------------------------------------- | --------- | -------------------------- | ------------------------------------------------------------------------------------ |
| SSH open to the world (`0.0.0.0/0` → port 22)           | Critical  | DevSecOps / Cloud Engineer | Restrict SSH access to specific IPs or VPN; modify the `ingress` block in Terraform. |
| Egress open to all traffic (`0.0.0.0/0` → port -1)      | Critical  | DevSecOps / Cloud Engineer | Restrict allowed ports and destinations; update the `egress` block.                  |
| EC2 unencrypted (`root_block_device encrypted = false`) | Critical  | DevSecOps / Cloud Engineer | Enable EBS encryption: `encrypted = true`.                                           |
| IMDSv1 enabled on EC2                                   | Critical  | DevSecOps / Cloud Engineer | Switch to IMDSv2: `metadata_options { http_tokens = "required" }`.                   |
| Missing IAM role on EC2                                 | Critical  | DevSecOps / Cloud Engineer | Attach an IAM role with least-privilege permissions.                                 |
| Security Group missing descriptions                     | Important | Dev / DevSecOps            | Add clear descriptions for each rule in Terraform (`description = "..."`).           |
| EC2 not EBS-optimized                                   | Medium    | DevSecOps / Cloud Engineer | Add `ebs_optimized = true` for better performance and security.                      |
| EC2 detailed monitoring not enabled                     | Medium    | DevSecOps / Cloud Engineer | Enable `monitoring = true` in EC2 configuration.                                     |

---

## 🔹 Action Plan for GitHub Actions Vulnerabilities

| Vulnerability                          | Level     | Responsible                | Action to Take                                                                                                |
| -------------------------------------- | --------- | -------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Top-level permissions set to write-all | Important | DevSecOps / CI/CD Engineer | Limit permissions in the GitHub Actions workflow (change from `write-all` to `read` or specific permissions). |

---

## 🔹 Practical Notes

1. **Immediate priority:** SSH open, Egress open, unencrypted disks, IMDSv1, missing IAM role → these are critical security issues.
2. **Secondary improvements:** monitoring, EBS-optimized, missing descriptions → fix after the critical issues.
3. **Dev / DevSecOps collaboration:**

   * **DevSecOps:** fix infrastructure, secure pipeline.
   * **Developers:** add descriptions and follow secure templates provided by DevSecOps.

---

If you want, I can also create a **secure, corrected Terraform example** for your `main.tf` **with all these vulnerabilities fixed**, ready to deploy.

Do you want me to do that?
