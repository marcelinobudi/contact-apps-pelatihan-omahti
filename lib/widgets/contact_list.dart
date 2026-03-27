import 'package:contacts/models/contact.dart';
import 'package:contacts/widgets/contact_item_tile.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.contacts});
  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text('Kontak tidak ditemukan.'),
      );
    }

    // Pakai ListView
    return ListView.builder(
      shrinkWrap: true, // Biar ga error SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), 
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        
        // Ambil 1 huruf paling depan
        String hurufPertama = contact.fullName[0].toUpperCase();
        bool tampilkanHeader = false;
        
        if (index == 0) {
          tampilkanHeader = true;
        } else {
          String hurufSebelumnya = contacts[index - 1].fullName[0].toUpperCase();
          if (hurufPertama != hurufSebelumnya) {
            tampilkanHeader = true;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tampilkanHeader) ...[
              if (index != 0) const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  hurufPertama,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
            
            // Panggil widget item per baris
            ContactItemTile(contact: contact),
          ],
        );
      },
    );
  }
}