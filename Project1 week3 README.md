# 🛡️ CodeFortress Pipeline: DAST & Containerization (Week 3)

This project stage focuses on **Dynamic Application Security Testing (DAST)** and **Containerization**. [cite_start]While Week 2 involved Static Analysis (SAST) of the raw code, Week 3 focuses on attacking the application while it is active in a staging environment to find runtime vulnerabilities[cite: 1, 34, 57].

## 👥 Project Team
* **Sumit Sharma** – Team Leader 👑
* **Chinmai Raj** – Member 🔍
* **Dhananjay Sinh** – Member ⚙️

## 🛠️ Features Implemented
* [cite_start]✅ **Containerization** – Used Docker to package the Python Flask application into a portable image.
* [cite_start]✅ **Staging Deployment** – Deployed the containerized app to a staging environment on port 5000.
* [cite_start]✅ **Dynamic Analysis (DAST)** – Configured **OWASP ZAP** to "Spider" and run an "Active Scan" against the staging URL[cite: 34, 57].
* [cite_start]✅ **Vulnerability Injection** – Intentionally introduced a Reflected XSS flaw to verify pipeline detection capabilities.

## 🚨 Dynamic Security Finding
During the OWASP ZAP Active Scan, a **High** level vulnerability was confirmed:

> [cite_start]**Issue:** Reflected Cross-Site Scripting (XSS).
> [cite_start]**Impact:** Attackers can inject malicious scripts into the web page, compromising user sessions and data.
> [cite_start]**Detection Method:** ZAP successfully identified the flaw in the staging build during the automated attack phase.



## 🚀 Execution Steps

### 1️⃣ Build and Run the Container
Ensure your terminal is in the project root on Kali Linux:
```bash
# Build the Docker image
sudo docker build -t codefortress-app .

# Run the staging environment
sudo docker run -p 5000:5000 codefortress-app

2️⃣ Execute DAST Scan
Open OWASP ZAP.

Go to Quick Start -> Automated Scan.

Set URL to attack to: http://localhost:5000/?name=test.

Click Attack to begin the Spider and Active Scan processes.

3️⃣ Generate the Report
Go to Report -> Generate Report.

Select the Modern HTML Report template.

Save as ZAP_Security_Report.html in the repository root.

📊 Week 3 Gate Check StatusGate Check Status: PASSED ✅TaskStatusContainerize Target Application (Docker)COMPLETED 3Deploy to Staging EnvironmentCOMPLETED 4OWASP ZAP "Spider" & "Active Scan"COMPLETED 5Successfully Identify Intentional XSS FlawCOMPLETED 6

🛠 Tools Used

OWASP ZAP – Dynamic Application Security Testing (DAST) 


Docker – Containerization & Staging Deployment 

Python (Flask) – Application Framework


TruffleHog – Secret Scanning (AWS Key Detection)