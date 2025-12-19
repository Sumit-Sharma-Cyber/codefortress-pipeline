Sprint: Week 1 - Pipeline & Secret Detection
1. Project Overview
This project focuses on the "Shift Left" paradigm, integrating security directly into the development lifecycle. Our goal is to prevent developers from accidentally pushing hardcoded credentials and sensitive secrets into remote repositories. By implementing automated secret scanning, we ensure that security is not a bottleneck but a seamless part of the DevOps velocity.




2. Team Collaboration (Blue Team Alpha)
The following team members collaborated on this sprint to establish the foundational security gate:

Sumit Sharma(Team Leader)

Chinmai Raj

Dhananjaysinh

3. The Defensive Arsenal (Tools Used)

TruffleHog: A specialized high-speed secret scanning tool used to detect leaked credentials (AWS keys, API tokens) in git repositories and commits.


Git Bash: Used for local version control operations and terminal-based commands.

VS Code: Our primary Integrated Development Environment (IDE) for code creation and staging.


Kali Linux: The offensive/defensive security platform used to run the scanning tools and simulate the environment.

GitHub: The remote repository platform serving as our centralized code store.

4. Implementation: Step-by-Step
We followed the Infotact CDOC rigid sprint cycle to meet the "Zero Trust" ecosystem requirements.


Step 1: Environment Setup We initialized a GitHub repository (trufflehog-test) and configured our local development environment using VS Code and Git Bash.

Step 2: Intentional Vulnerability Injection To test our security gate, we created a Python script (app.py) containing high-entropy, fake AWS credentials and API keys:

Python

print("Hello Secure World")

AWS_ACCESS_KEY_ID = "AKIA123456789TESTKEY"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYTESTKEY"

API_ENDPOINT = "https://api.example.com/v1/data"

print("AWS Key:", AWS_ACCESS_KEY_ID)
print("API Endpoint:", API_ENDPOINT)
Step 3: Automated Secret Scanning We utilized TruffleHog to scan the repository. The tool was tasked with identifying strings that match high-entropy patterns typical of secret keys.

Command: trufflehog https://github.com/dhananjayjoddha-cloud/trufflehog-test

5. Results & Review (Gate Check)

Gate Check Status: PASSED  TruffleHog successfully detected the "High Entropy" secrets within the commit history.


Scan Output:

Reason: High Entropy Date: 2025-12-14 Filepath: README.md Detected Secret: AWS_SECRET_KEY=AKIA123456789TESTKEY

6. Final Directive
As per Infotact Solutions' policy, we have verified that our pre-commit hooks and external scans effectively block secrets from reaching production-grade environments. "Trust No One. Verify Everything."
