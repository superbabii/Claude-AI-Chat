from flask import Flask, request, jsonify, render_template
import os
import asyncio
import subprocess
from waitress import serve

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/run', methods=['POST'])
def run_claude():
    model_choice = request.form.get('model_choice')
    user_input = request.form.get('user_input')
    
    # Modify main.py to accept command line arguments for model and input
    result = subprocess.run(['python', 'main.py', model_choice, user_input], capture_output=True, text=True)
    return jsonify(result.stdout)

if __name__ == '__main__':
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    serve(app, host='0.0.0.0', port=5000)


