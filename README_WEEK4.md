# Week 4: DevSecOps Pipeline Automation & Remediation

## Project Overview
This week focused on automating the security pipeline for the **CodeFortress-pipeline** project and remediating critical vulnerabilities identified in previous weeks.

## 🛠️ Security Tools Integrated
The following tools were integrated into the automated `run_scans.sh` script:
* **TruffleHog**: Scanned for hardcoded secrets and AWS credentials.
* **SonarQube (SAST)**: Performed Static Application Security Testing on `app.py`.
* **OWASP ZAP (DAST)**: Conducted Dynamic Application Security Testing against the running Flask application.
* **DefectDojo**: Centralized all scan results for vulnerability management.

## ✅ Remediation Steps Taken
1. **Secret Management**: Removed hardcoded AWS keys from the source code and updated the `.gitignore` to prevent future leaks.
2. **XSS Mitigation**: Sanitized user inputs in `app.py` using Jinja2 auto-escaping to prevent Cross-Site Scripting (XSS) attacks.
3. **Pipeline Automation**: Created a shell script to execute all scans and automatically upload results to the DefectDojo Engagement.

## 📊 Final Results
* **Total Tests Conducted**: 6
* **Engagement Status**: Completed / Remediated
* **Key Deliverable**: [Full Security Audit Report](./Full_Security_Report.pdf)

## How to Run Scans
```bash
chmod +x run_scans.sh
./run_scans.sh

---

### 3. Save and Push to GitHub
After pasting the text into Nano, press **Ctrl+O**, then **Enter** to save, and **Ctrl+X** to exit. Then, run these commands to update your repository:

```bash
# Rename it to the main README if you want it to show on the front page
mv README_WEEK4.md README.md

# Push to GitHub
git add README.md
git commit -m "Update README with Week 4 Automation and Remediation details"
git push origin main
