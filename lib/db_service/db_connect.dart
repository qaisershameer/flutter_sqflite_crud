// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import '../database/contacts.dart';
//
// class DBHelper {
//
//   // Increment the version whenever schema changes (e.g., from version 1 to 2)
//   static const int DB_VERSION = 2; // Change this value when updating the schema
//
//   // This method initializes the SQLite database
//   static Future<Database> initDB() async {
//
//     var dbPath = await getDatabasesPath();
//
//     String path = join(dbPath, 'contacts.db');
//
//     // Open the database with versioning and migration support
//     return await openDatabase(dbPath, version: DB_VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
//   }
//
//   getDBPath() async {
//
//     var dbPath = await getDatabasesPath();
//     print('======================dbPath in AppFolder $dbPath');
//
//     Directory? externalStoragePath = await getExternalStorageDirectory();
//     print('======================fileManagerPath Main Files $dbPath');
//
//     String path = join(dbPath, 'contacts.db');
//
//     return await openDatabase(dbPath,
//         version: DB_VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
//
//   }
//
//   // This is the callback function that runs when the database is first created
//   static Future _onCreate(Database db, int version) async {
//     final sql = '''CREATE TABLE contacts(
//       id INTEGER PRIMARY KEY,
//       name TEXT,
//       contact TEXT
//     )''';
//     await db.execute(sql);
//   }
//
//   // This method handles migrations when upgrading the database version
//   static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < 2) {
//       // Migration for version 2: Add a new column (for example, "email")
//       await db.execute('''ALTER TABLE contacts ADD COLUMN email TEXT''');
//     }
//     // You can add additional migration steps for future versions
//     // Example: if (oldVersion < 3) { ... }
//   }
//
//   // Function to insert a new contact into the database
//   static Future<int> createContacts(Contact contact) async {
//     Database db = await DBHelper.initDB();
//     return await db.insert('contacts', contact.toJson());
//   }
//
//   // Function to retrieve all contacts from the database
//   static Future<List<Contact>> readContacts() async {
//     Database db = await DBHelper.initDB();
//     var contact = await db.query('contacts', orderBy: 'name');
//
//     List<Contact> contactList = contact.isNotEmpty
//         ? contact.map((details) => Contact.fromJson(details)).toList()
//         : [];
//     return contactList;
//   }
//
//   // Function to update an existing contact in the database
//   static Future<int> updateContacts(Contact contact) async {
//     Database db = await DBHelper.initDB();
//     return await db.update('contacts', contact.toJson(),
//         where: 'id = ?', whereArgs: [contact.id]);
//   }
//
//   // Function to delete a contact from the database
//   static Future<int> deleteContacts(int id) async {
//     Database db = await DBHelper.initDB();
//     return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future backupDB() async {
//     var status = await Permission.manageExternalStorage.status;
//
//     if(!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }
//
//     var status1 = await Permission.storage.status;
//
//     if(!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }
//
//     try{
//       File ourDBFile = File('/data/user/0/com.example.accounts/databases/contacts.db');
//       Directory? folderPathforDBFile = Directory('/data/user/0/com.example.accounts/databases');
//
//     } catch (e) {
//       print('============================error backup: ${e.toString()}');
//     }
//   }
//
//   restoreDB() async {
//
//     var status = await Permission.manageExternalStorage.status;
//
//     if(!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }
//
//     var status1 = await Permission.storage.status;
//
//     if(!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }
//
//     try{
//
//       File savedDBFile = File('/data/user/0/com.example.accounts/databases/contacts.db');
//
//       await savedDBFile.copy('/data/user/0/com.example.accounts/databases');
//
//
//     } catch (e) {
//       print('============================error restore: ${e.toString()}');
//     }
//
//   }
//
//   deleteDB() async {
//     try{
//       // _database = null;
//       deleteDatabase('/data/user/0/com.example.accounts/databases/contacts.db');
//     } catch (e) {
//       print('============================error delete: ${e.toString()}');
//     }
//   }
//
// }

import 'dart:io';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../database/contacts.dart';

class DBHelper {
  // Database Version
  static const int DB_VERSION = 2;

  // Database paths and file names
  static const String DB_NAME = 'contacts.db';
  static late String dbPath;
  static late Directory? externalStoragePath;

  // Permission statuses
  static late bool isExternalStoragePermissionGranted;
  static late bool isStoragePermissionGranted;

  // Initialize paths and permissions
  static Future<void> initialize() async {
    dbPath = await getDatabasesPath();
    externalStoragePath = await getExternalStorageDirectory();

    isExternalStoragePermissionGranted = await Permission.manageExternalStorage.isGranted;
    isStoragePermissionGranted = await Permission.storage.isGranted;
  }

  // Initialize the SQLite database
  static Future<Database> initDB() async {
    await initialize(); // Ensure paths and permissions are set before proceeding

    // Open the database with versioning and migration support
    return await openDatabase(join(dbPath, DB_NAME),
        version: DB_VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  // Callback to create database schema
  static Future _onCreate(Database db, int version) async {
    final sql = '''CREATE TABLE contacts(
      id INTEGER PRIMARY KEY,
      name TEXT,
      contact TEXT
    )''';
    await db.execute(sql);
  }

  // Callback to handle database schema migrations
  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''ALTER TABLE contacts ADD COLUMN email TEXT''');
    }
    // Additional migrations can be added here as needed
  }

  // Insert a new contact
  static Future<int> createContacts(Contact contact) async {
    Database db = await initDB();
    return await db.insert('contacts', contact.toJson());
  }

  // Retrieve all contacts
  static Future<List<Contact>> readContacts() async {
    Database db = await initDB();
    var result = await db.query('contacts', orderBy: 'name');
    return result.isNotEmpty
        ? result.map((details) => Contact.fromJson(details)).toList()
        : [];
  }

  // Update an existing contact
  static Future<int> updateContacts(Contact contact) async {
    Database db = await initDB();
    return await db.update('contacts', contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  // Delete a contact
  static Future<int> deleteContacts(int id) async {
    Database db = await initDB();
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  // Backup database
  static Future<void> backupDB() async {
    if (!isExternalStoragePermissionGranted) {
      await Permission.manageExternalStorage.request();
    }

    if (!isStoragePermissionGranted) {
      await Permission.storage.request();
    }

    try {
      File sourceFile = File(join(dbPath, DB_NAME));
      if (externalStoragePath != null) {
        Directory backupDirectory = Directory(externalStoragePath!.path);
        if (!await backupDirectory.exists()) {
          await backupDirectory.create();
        }
        String backupFilePath = join(backupDirectory.path, DB_NAME);
        await sourceFile.copy(backupFilePath);
        print("Database backup successful.");
      } else {
        print("External storage not available.");
      }
    } catch (e) {
      print('Error during backup: ${e.toString()}');
    }
  }

  // Restore database from backup
  static Future<void> restoreDB() async {
    if (!isExternalStoragePermissionGranted) {
      await Permission.manageExternalStorage.request();
    }

    if (!isStoragePermissionGranted) {
      await Permission.storage.request();
    }

    try {
      File backupFile = File(join(externalStoragePath!.path, DB_NAME));
      if (await backupFile.exists()) {
        await backupFile.copy(join(dbPath, DB_NAME));
        print("Database restored successfully.");
      } else {
        print("Backup file not found.");
      }
    } catch (e) {
      print('Error during restore: ${e.toString()}');
    }
  }

  // Delete the database
  static Future<void> deleteDB() async {
    if (!isStoragePermissionGranted) {
      await Permission.storage.request();
    }

    try {
      await deleteDatabase(join(dbPath, DB_NAME));
      print("Database deleted.");
    } catch (e) {
      print('Error during delete: ${e.toString()}');
    }
  }


}
