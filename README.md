# flutter_sqflite_crud


    
#   local db to live db sync query example.

    select * FROM Accounts WHERE$ updated_at > COALESCE(lastSyncedTimestamp, '1970-01-01T00:00:00.000Z');
	
	update Accounts SET lastSyncedTimestamp = CURRENT_TIMESTAMP
	WHERE$ updated_at > COALESCE(lastSyncedTimestamp, '1970-01-01T00:00:00.000Z');