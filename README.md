# Real-Time Fraud Detection Platform (Event-Driven Serverless Architecture)

## 🚀 Project Overview

This project demonstrates a **cloud-native event-driven serverless platform** for **real-time fraud detection** using **AWS MSK (Kafka)**, **AWS Lambda**, **Terraform**, and **GitHub Actions** CI/CD.

A Python **producer application** sends simulated transaction events to Kafka, while a **Lambda function** consumes and analyzes these events to detect potential fraud based on dynamic thresholds.

---

## 🎯 Key Features

- Real-time streaming of transaction events using **AWS MSK**.
- **Serverless fraud detection** with AWS Lambda triggered by Kafka events.
- **Infrastructure as Code (IaC)** using Terraform for consistent deployments.
- **CI/CD pipeline** using GitHub Actions for automation.
- Local event simulation with a **Python Kafka producer**.
- Scalable, serverless, and cost-optimized architecture.
- Easy to extend with databases (DynamoDB, RDS) and monitoring (CloudWatch, Prometheus).

---

## 📈 Architecture

> *(Placeholder for Architecture Diagram — Save your draw.io or Excalidraw diagram in `/docs/` folder)*

```
+----------------+       Kafka Events       +--------------------+       Fraud Detection Logic
| Producer (Py)  |  --->  AWS MSK (Kafka) --->| AWS Lambda         | ---> (Flag Suspicious Transactions)
+----------------+                           +--------------------+
                                              |
                                              v
                                        AWS CloudWatch Logs
```

---

## 🛠️ Technology Stack

- **AWS MSK** (Managed Kafka Cluster)
- **AWS Lambda** (Python 3.8 Runtime)
- **Terraform** (AWS Infrastructure as Code)
- **GitHub Actions** (CI/CD Automation)
- **Python 3.x** (Producer, Lambda function)
- **Kafka-python** library

---

## 📋 Prerequisites

- AWS Account with permissions for MSK, Lambda, IAM, etc.
- AWS CLI installed and configured
- Terraform >= v1.0 installed
- Python 3.x installed
- Git installed
- Docker (optional) if you want to build locally in containers
- Kafka CLI (optional) for topic management

---

## 📂 Repository Structure

```
real-time-fraud-detection/
├── README.md
├── LICENSE
├── .gitignore
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
├── lambda_functions/
│   └── fraud_detection/
│       ├── app.py
│       ├── requirements.txt
│       └── deployment_package.sh
├── producer/
│   └── producer.py
├── .github/
│   └── workflows/
│       └── ci.yml
└── docs/
    └── architecture-diagram.png (Optional)
```

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/real-time-fraud-detection.git
cd real-time-fraud-detection
```

### 2. Provision AWS Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```
Provisioned resources:
- MSK Kafka Cluster
- Lambda Execution Role
- Lambda Function
- Event Source Mapping (Kafka ➔ Lambda)

---

## 🐍 Deploy and Package Lambda Function

```bash
cd lambda_functions/fraud_detection
chmod +x deployment_package.sh
./deployment_package.sh
```
This creates `deployment_package.zip` required for Lambda deployment.

---

## 🛰️ Run Kafka Producer Locally (for Testing)

Install required Python libraries:

```bash
pip install kafka-python
```

Update `producer/producer.py` with your MSK Bootstrap server endpoint:

```python
bootstrap_servers=['your-msk-endpoint:9092']
```

Run the producer:

```bash
cd producer
python producer.py
```
It sends random transaction events to the Kafka topic: `fraud-transactions`.

---

## ⚡ CI/CD Pipeline (GitHub Actions)

The project includes a GitHub Actions workflow that:
- Checks out code
- Installs Python dependencies
- Packages Lambda
- Runs a sample Kafka producer test
- Runs Terraform format check, init, and plan

Path: `.github/workflows/ci.yml`

Trigger: On `push` or `pull_request` to `main` branch.

---

## 🧠 Future Enhancements

- [ ] Save flagged transactions to DynamoDB.
- [ ] Integrate with AWS SNS for Fraud Alert notifications.
- [ ] Add a Dashboard (Grafana/CloudWatch Metrics).
- [ ] Use SQS Dead Letter Queue (DLQ) for Lambda event failure handling.
- [ ] Add automated end-to-end tests (e2e) with Kafka.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Built with ❤️ by Your Name**

- GitHub: [yourusername](https://github.com/yourusername)
- LinkedIn: [yourprofile](https://linkedin.com/in/yourprofile)

---

> **Feel free to fork, contribute, raise issues, or suggest enhancements! 🚀**
