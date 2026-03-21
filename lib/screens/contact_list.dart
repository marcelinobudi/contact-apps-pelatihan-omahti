import 'package:contacts/models/contact.dart';
import 'package:contacts/providers/contact_list_provider.dart';
import 'package:contacts/screens/add_contact.dart';
import 'package:contacts/widgets/app_bar_contact_list.dart';
import 'package:contacts/widgets/contact_item_tile.dart';
import 'package:contacts/widgets/contact_list.dart';
import 'package:contacts/widgets/contact_searching_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Contact> contacts = [];
  String searchInput = '';

  void _searchControllerListener() {
    setState(() {
      searchInput = searchController.text;
    });
  }

  List<Contact> searchContact(String fullName) {
    final List<Contact> searchResult = contacts.where((element) {
      int lastIndexCharacter = (element.fullName.length < fullName.length)
          ? element.fullName.length
          : fullName.length;
      return element.fullName.substring(0, lastIndexCharacter).toLowerCase() ==
          fullName.toLowerCase();
    }).toList();
    return searchResult;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    searchController.addListener(_searchControllerListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    contacts = ref.watch(contactListProvider);
    Widget mainContent = ContactList(
      contacts: contacts,
    ); // IQBALLL, di sini ya list contactnya

    if (searchInput.isNotEmpty) {
      final searchResult = searchContact(searchInput);
      mainContent = ContactSearchingResult(contacts: searchResult);
    }

    return Scaffold(
      floatingActionButton: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (ctx) => AddContactScreen()));
        },
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
                controller: searchController,
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
              mainContent,
            ],
          ),
        ),
      ),
    );
  }
}
