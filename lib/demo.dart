import 'package:flutter/material.dart';
import 'package:contact_app/general/add_contact.dart';
import 'package:contact_app/database/contacts.dart';
import 'package:contact_app/db_service/db_connect.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  DBHelper dbHelper = DBHelper();  // Create an instance of DBHelper

  // Helper method to trigger FutureBuilder refresh
  Future<List<Contact>> getContacts() async {
    return await DBHelper.readContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SQFLite'),
      ),
      // Add Future Builder to get contacts
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row to align buttons horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Implement your backup functionality
                    await DBHelper.backupDB();
                  },
                  child: Text("Backup"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Implement your restore functionality
                    await DBHelper.restoreDB();
                    setState(() {
                      getContacts();
                    });
                  },
                  child: Text("Restore"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Implement functionality for delete database
                    await DBHelper.deleteDB();
                    setState(() {
                      getContacts();
                    });
                  },
                  child: Text("Delete"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigate to add new contact page
                    final refresh = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AddContacts()),
                    );

                    // Refresh if a contact was added
                    if (refresh != null && refresh) {
                      setState(() {
                        // Trigger a rebuild after adding a contact
                      });
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
            SizedBox(height: 16), // Space between buttons and FutureBuilder

            // FutureBuilder to fetch contacts
            FutureBuilder<List<Contact>>(
              future: getContacts(), // Fetch contacts
              builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
                // Check if data is being fetched
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading...'),
                      ],
                    ),
                  );
                }

                // If no contacts are found
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No Contact in List yet!'),
                  );
                }

                // Display contacts in a ListView
                return Expanded(
                  child: ListView(
                    children: snapshot.data!.map((contact) {
                      return ListTile(
                        title: Text(contact.name),
                        subtitle: Text(contact.contact),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            // Delete contact
                            await DBHelper.deleteContacts(contact.id!);
                            setState(() {
                              // Trigger a rebuild after deleting
                            });
                          },
                        ),
                        onTap: () async {
                          // Tap on contact to update
                          final refresh = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => AddContacts(
                                contact: Contact(
                                  id: contact.id,
                                  name: contact.name,
                                  contact: contact.contact,
                                ),
                              ),
                            ),
                          );

                          // Refresh if updated
                          if (refresh != null && refresh) {
                            setState(() {
                              // Trigger a rebuild after updating
                            });
                          }
                        },
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // Floating action button to add new contact
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () async {
      //     // Navigate to add new contact page
      //     final refresh = await Navigator.of(context).push(
      //       MaterialPageRoute(builder: (_) => AddContacts()),
      //     );
      //
      //     // Refresh if a contact was added
      //     if (refresh != null && refresh) {
      //       setState(() {
      //         // Trigger a rebuild after adding a contact
      //       });
      //     }
      //   },
      // ),
    );
  }
}
