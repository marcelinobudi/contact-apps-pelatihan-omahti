import 'package:contacts/data/dummy_contacts.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:contacts/models/contact.dart';

final contactListProvider =
    StateNotifierProvider<ContactListNotifier, List<Contact>>((ref) {
      return ContactListNotifier();
    });

class ContactListNotifier extends StateNotifier<List<Contact>> {
  ContactListNotifier() : super(contactList);

  // IqbaAAAL, disini ya buat logika insertion by string fullName
  void addContact(Contact contact) {
    // aturan penting: state harus diubah dengan assignment, bukan method.
    state = [...state, contact];
  }

  void deleteContact(int id) {
    // HOHO Linear search, lambat ni harusnya, cuma yaudalah soalnya contactnya ga bakal terlalu banyak
    // Iqbal, kalau kamu mau nerapain array terurut atau terserah kamu wkwkw, logika pengurutan kupasrahkan ke kamu.
    state = state.where((element) => element.id != id).toList();
  }

  void editContact(Contact contact) {
    deleteContact(contact.id!);
    addContact(contact);
  }
}
