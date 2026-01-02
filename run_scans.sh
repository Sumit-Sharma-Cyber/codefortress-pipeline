#!/bin/bash

# --- CONFIGURATION ---
ENG_ID="1" 
API_KEY="Token 7db3a14d1729fcf763da051c94e7f0e1626f08f0"
DOJO_URL="http://localhost:8888/api/v2/import-scan/"
SONAR_TOKEN="sqp_6ddbc42ea2a197c930338823340f8a2830b82d0c"

echo "-------------------------------------------------------"
echo "🛡️  WEEK 4: FINAL AUTOMATED PIPELINE"
echo "-------------------------------------------------------"

# 1. TRUFFLEHOG (Secrets)
echo "[+] Running TruffleHog..."
trufflehog filesystem app.py --json --results=verified,unverified > trufflehog.json
curl -X POST "$DOJO_URL" -H "Authorization: $API_KEY" \
     -F "scan_type=Trufflehog Scan" -F "file=@trufflehog.json" -F "engagement=$ENG_ID"

# 2. SONARQUBE (Static Analysis)
echo "[+] Fetching SonarQube issues..."
curl -u "${SONAR_TOKEN}:" "http://localhost:9001/api/issues/search?componentKeys=codefortress-pipeline" > sonar.json
curl -X POST "$DOJO_URL" -H "Authorization: $API_KEY" \
     -F "scan_type=SonarQube API Import" -F "file=@sonar.json" -F "engagement=$ENG_ID"

# 3. OWASP ZAP (Dynamic Analysis)
echo "[+] Starting App for ZAP Scan..."
python3 app.py & 
APP_PID=$!
sleep 5 

echo "[+] Running ZAP Baseline Scan via Docker..."
# Note: Using sudo here to prevent the "Permission Denied" error you saw
sudo docker run --network="host" -v $(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py \
    -t http://127.0.0.1:5000 -J zap_report.json

echo "[+] Uploading ZAP Report..."
curl -X POST "$DOJO_URL" -H "Authorization: $API_KEY" \
     -F "scan_type=ZAP Scan" -F "file=@zap_report.json" -F "engagement=$ENG_ID"

# Cleanup
kill $APP_PID

echo "-------------------------------------------------------"
echo "✅ WEEK 4 COMPLETE: All reports pushed to DefectDojo!"
