from flask import Flask, request
from markupsafe import escape

app = Flask(__name__)

# WEEK 4 REMEDIATION: 
# 1. Hardcoded AWS keys have been removed.
# 2. XSS vulnerability fixed using markupsafe.escape.

@app.route('/')
def home():
    user_name = request.args.get('name', 'Intern')
    safe_name = escape(user_name)
    
    return f"""
    <h1>CodeFortress Staging Environment</h1>
    <p>Welcome, {safe_name}!</p>
    <p>Status: Secure (Secrets removed & Input sanitized)</p>
    """

if __name__ == '__main__':
    # Using 127.0.0.1 for local development security
    app.run(host='127.0.0.1', port=5000)
