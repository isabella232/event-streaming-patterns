CREATE OR REPLACE STREAM login (
  user_id BIGINT,
  country_code VARCHAR
) WITH (
  kafka_topic = 'login_topic',
  value_format = 'AVRO',
  partitions = 3
);

CREATE OR REPLACE STREAM withdrawal (
  user_id BIGINT,
  country_code VARCHAR,
  amount DECIMAL(10,2),
  success BOOLEAN
) WITH (
  kafka_topic = 'withdrawal_topic',
  value_format = 'AVRO',
  partitions = 3
);

CREATE STREAM possible_fraud
  AS
    SELECT l.user_id, l.country_code, w.country_code, w.amount, w.success
    FROM login l
      JOIN withdrawal w
      WITHIN 1 DAY
      ON l.user_id = w.user_id
    WHERE l.country_code != w.country_code
    EMIT CHANGES;
