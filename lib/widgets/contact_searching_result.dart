import 'package:contacts/models/contact.dart';
import 'package:contacts/widgets/contact_item_tile.dart';
import 'package:flutter/material.dart';

class ContactSearchingResult extends StatelessWidget {
  const ContactSearchingResult({super.key, required this.contacts});
  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) => ContactItemTile(contact: contacts[index]),
    );
    ;
  }
}
