CREATE STREAM dispatch_products (
  order_id BIGINT KEY,
  address VARCHAR
) WITH (
  KAFKA_TOPIC = ' dispatch_products',
  VALUE_FORMAT = 'AVRO',
  PARTITIONS = 2
);
