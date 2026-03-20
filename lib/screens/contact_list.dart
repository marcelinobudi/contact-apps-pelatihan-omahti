import 'package:contacts/models/contact.dart';
import 'package:contacts/providers/contact_list_provider.dart';
import 'package:contacts/widgets/app_bar_contact_list.dart';
import 'package:contacts/widgets/contact_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactListScreen extends ConsumerWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Contact> contacts = ref.watch(contactListProvider);
    return Scaffold(
      floatingActionButton: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {},
        iconSize: 42,
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .max,
            children: [
              AppBarContactList(contactLength: contacts.length),
              SizedBox(height: 8),
              TextField(
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.tertiaryContainer,
                  filled: true,
                  hint: Text('Cari...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    iconSize: 24,
                    onPressed: () {},
                  ),
                ),
              ),
              ListView.builder(
                itemCount: contacts.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) =>
                    ContactItemTile(contact: contacts[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
