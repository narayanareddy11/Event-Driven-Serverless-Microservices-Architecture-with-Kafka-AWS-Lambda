
#!/bin/bash
set -e

rm -f deployment_package.zip
mkdir -p package
pip install -r requirements.txt -t package
cp app.py package/
cd package
zip -r ../deployment_package.zip .
cd ..
rm -rf package
echo "Deployment package created: deployment_package.zip"
