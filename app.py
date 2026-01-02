from flask import Flask, request

app = Flask(__name__)

# --- WEEK 1 & 2 SECRETS (For Trufflehog/SonarQube) ---
# The following AWS credentials are FAKE and FOR TESTING PURPOSES ONLY.
# These keys DO NOT work and must never be used in production environments.
AWS_ACCESS_KEY_ID = "AKIA123456789TESTKEY"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYTESTKEY"

@app.route('/')
def home():
    # --- WEEK 3 VULNERABILITY: Reflected XSS ---
    # This takes input from the URL (?name=...) and reflects it without cleaning.
    # ZAP will exploit this to prove the DAST pipeline works.
    user_name = request.args.get('name', 'Intern')
    
    return f"""
    <h1>CodeFortress Staging Environment</h1>
    <p>Welcome, {user_name}!</p>
    <p>AWS Key Status: Loaded (For Testing Only)</p>
    """

if __name__ == '__main__':
    # Run on port 5000 for the Docker container
    app.run(host='0.0.0.0', port=5000)



