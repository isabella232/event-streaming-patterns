CREATE OR REPLACE STREAM package_checkins (
  package_id BIGINT KEY,
  location VARCHAR
) WITH (
  kafka_topic = 'package_checkins_topic',
  value_format = 'AVRO',
  partitions = 3
);

CREATE OR REPLACE TABLE package_locations AS
  SELECT package_id, latest_by_offset(location) AS current_location
  FROM package_checkins
  GROUP BY package_id;
