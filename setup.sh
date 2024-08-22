#!/bin/bash

# Step 1: Clone the GitHub repository
echo "Cloning the GitHub repository..."
git clone https://github.com/superbabii/Claude-AI-Chat.git

# Step 2: Navigate into the cloned repository
cd Claude-AI-Chat || { echo "Failed to enter the directory"; exit 1; }

# Step 3: Create a .env file with the provided API keys
echo "Creating a .env file..."
cat <<EOT > .env
ANTHROPIC_API_KEY="your_anthropic_api_key"
TAVILY_API_KEY="your_tavity_api_key"
EOT

# Step 4: Create the Python virtual environment
echo "Creating the Python virtual environment..."
python3 -m venv code_execution_env

# Step 5: Activate the virtual environment
echo "Activating the virtual environment..."
# Detect the operating system and activate accordingly
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source code_execution_env/Scripts/activate
else
    source code_execution_env/bin/activate
fi

# Step 6: Install required Python packages from requirements.txt
echo "Installing required Python packages..."
pip install -r requirements.txt

# Step 7: Run the Flask app
# echo "Running the Flask app..."
# python app.py

# End of script
