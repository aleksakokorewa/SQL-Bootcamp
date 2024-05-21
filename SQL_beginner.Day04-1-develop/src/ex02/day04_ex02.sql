CREATE VIEW v_generated_dates AS
  (SELECT days::DATE AS generated_date
    FROM generate_series('2022-01-02', '2022-01-31', INTERVAL '1 day') AS days
    ORDER BY generated_date
    );