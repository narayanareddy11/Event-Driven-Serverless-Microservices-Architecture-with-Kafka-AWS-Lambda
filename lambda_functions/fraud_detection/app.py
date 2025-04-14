
import base64
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Received event: %s", json.dumps(event))
    for topic, records in event.get("records", {}).items():
        for record in records:
            payload = base64.b64decode(record.get("value", ""))
            try:
                transaction = json.loads(payload)
                logger.info("Processing transaction: %s", transaction)
                if transaction.get("amount", 0) > 10000:
                    logger.warning("Potential fraud detected: %s", transaction)
            except Exception as e:
                logger.error("Error processing record: %s", e)
    return {"statusCode": 200, "body": json.dumps("Processed successfully.")}
