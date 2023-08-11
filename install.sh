# Validate Python3 version
if ! hash python3; then
    echo "Python3 is not installed, Recommended python version is 3.9.5"
    exit 1
fi

ver_major=$(python3 -V 2>&1 | sed 's/.* \([0-9]*\).\([0-9]*\).*/\1/')
ver_minor=$(python3 -V 2>&1 | sed 's/.* \([0-9]*\).\([0-9]*\).*/\2/')
echo "Python Version:`python3 -V 2>&1`"
if [ "$ver_major" -lt "3" ] || [ "$ver_minor" -lt "9" ]; then
    echo "This script requires python 3.9 or greater"
    exit 1
fi

echo "Enable virtual-env:"
# Configure virtual env
echo "\tCreating..."
python3 -m venv venv
echo "\tActivating..."
source venv/bin/activate

# Install dependencies
echo "Installing the dependencies required for Aetos..."
python3 -m pip install --upgrade pip
pip3 install -r requirements.txt
