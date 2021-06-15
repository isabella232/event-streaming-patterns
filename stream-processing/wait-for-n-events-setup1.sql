CREATE OR REPLACE STREAM trade_review (
  trade_id BIGINT,
  manager_id VARCHAR,
  signature VARCHAR,
  approved BOOLEAN
) WITH (
  kafka_topic = 'trade_review_topic',
  value_format = 'AVRO',
  partitions = 3
);
