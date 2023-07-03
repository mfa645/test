USE [TestSocialDiscusions]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
ALTER PROCEDURE [SchemaTesting].[test SeguidoresPK_False]
AS
BEGIN
 SET NOCOUNT ON;
  --Assemble
     DECLARE @expected INT; SET @expected = 1;
	 DECLARE @actual INT;
	 INSERT INTO	dbo.Usuario
	 (
	     idUsuario,
	     nombre,
	     verificado,
	     edad
	 )
	 VALUES
	 (   1,       -- idUsuario - bigint
	     'user1',      -- nombre - varchar(50)
	     DEFAULT, -- verificado - bit
	     18       -- edad - int
	     )

	INSERT INTO	dbo.Usuario
	 (
	     idUsuario,
	     nombre,
	     verificado,
	     edad
	 )
	 VALUES
	 (   2,       -- idUsuario - bigint
	     'user2',      -- nombre - varchar(50)
	     DEFAULT, -- verificado - bit
	     18       -- edad - int
	     )
      
	  INSERT INTO dbo.Seguidores
	  (
	      idSeguidor,
	      idSeguido
	  )
	  VALUES
	  (   1, -- idSeguidor - bigint
	      2  -- idSeguido - bigint
	      )
  --Act

   BEGIN TRY
 INSERT INTO	dbo.Seguidores
 (
     idSeguidor,
     idSeguido
 )
 VALUES
 (   1, -- idSeguidor - bigint
     2  -- idSeguido - bigint
     )
    END TRY
	BEGIN CATCH
    END CATCH;  

        SELECT @actual = COUNT(*) FROM dbo.Seguidores

  --Assert
 EXEC tSQLt.AssertEquals @expected,
                          @actual, 
                          @Message = 'La inserci�n se realiz�'
END;



