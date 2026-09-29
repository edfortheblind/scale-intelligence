-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE VIEW METADATA_TRANS_BUILD_WAVE_VIEW
AS
SELECT
  LAUNCH_NAME AS NAME,
  DESCRIPTION AS DESCRIPTION,
  LAUNCH_FLOW AS FLOW

FROM LAUNCH_MASTER WHERE Active=N'<literal:1>'