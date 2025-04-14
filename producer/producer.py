
import json
import time
from kafka import KafkaProducer

producer = KafkaProducer(
    bootstrap_servers=['<MSK_Broker_Endpoint>:9092'],
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

topic = "fraud-transactions"

def send_transaction(transaction):
    producer.send(topic, transaction)
    producer.flush()
    print("Sent transaction:", transaction)

if __name__ == "__main__":
    transaction_template = {
        "transaction_id": None,
        "amount": 0,
        "customer_id": "CUST123",
        "timestamp": None
    }
    counter = 1
    while True:
        transaction = transaction_template.copy()
        transaction["transaction_id"] = f"TXN_{counter}"
        transaction["amount"] = 5000 + counter * 1000
        transaction["timestamp"] = time.strftime("%Y-%m-%d %H:%M:%S")
        send_transaction(transaction)
        counter += 1
        time.sleep(5)
