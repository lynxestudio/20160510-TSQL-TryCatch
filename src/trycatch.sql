DECLARE
 @valueNumber int
BEGIN TRY
    SET @valueNumber = 25
 SELECT SQRT(@valueNumber) as 'square'
END TRY
BEGIN CATCH
  SELECT ERROR_NUMBER() as errorNumber
  ,ERROR_SEVERITY() as severity
  ,ERROR_STATE() as errorState
  ,ERROR_PROCEDURE() as errorProc
  ,ERROR_LINE() as line
  ,ERROR_MESSAGE() as errorMessage
END CATCH