import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Import this for path manipulation

import '../database/contacts.dart';

class DBHelper {
  // Increment the version whenever schema changes (e.g., from version 1 to 2)
  static const int DB_VERSION = 2; // Change this value when updating the schema

  // This method initializes the SQLite database
  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contacts.db');

    // Open the database with versioning and migration support
    return await openDatabase(path,
        version: DB_VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  // This is the callback function that runs when the database is first created
  static Future _onCreate(Database db, int version) async {
    final sql = '''CREATE TABLE contacts(
      id INTEGER PRIMARY KEY,
      name TEXT,
      contact TEXT
    )''';
    await db.execute(sql);
  }

  // This method handles migrations when upgrading the database version
  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Migration for version 2: Add a new column (for example, "email")
      await db.execute('''ALTER TABLE contacts ADD COLUMN email TEXT''');
    }
    // You can add additional migration steps for future versions
    // Example: if (oldVersion < 3) { ... }
  }

  // Function to insert a new contact into the database
  static Future<int> createContacts(Contact contact) async {
    Database db = await DBHelper.initDB();
    return await db.insert('contacts', contact.toJson());
  }

  // Function to retrieve all contacts from the database
  static Future<List<Contact>> readContacts() async {
    Database db = await DBHelper.initDB();
    var contact = await db.query('contacts', orderBy: 'name');

    List<Contact> contactList = contact.isNotEmpty
        ? contact.map((details) => Contact.fromJson(details)).toList()
        : [];
    return contactList;
  }

  // Function to update an existing contact in the database
  static Future<int> updateContacts(Contact contact) async {
    Database db = await DBHelper.initDB();
    return await db.update('contacts', contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  // Function to delete a contact from the database
  static Future<int> deleteContacts(int id) async {
    Database db = await DBHelper.initDB();
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}
