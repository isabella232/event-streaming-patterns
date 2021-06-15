CREATE OR REPLACE TABLE trade_approval AS
  SELECT trade_id, count(*) AS approvals
  FROM trade_review
  WHERE approved = TRUE
  GROUP BY trade_id;
