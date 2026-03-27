import 'package:contacts/data/dummy_contacts.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:contacts/models/contact.dart';

final contactListProvider =
    StateNotifierProvider<ContactListNotifier, List<Contact>>((ref) {
      return ContactListNotifier();
    });

class ContactListNotifier extends StateNotifier<List<Contact>> {
  ContactListNotifier() : super(contactList){
    insertionSort(state);
  }

  void insertionSort(List<Contact> list) {
    for (int i = 1; i < list.length; i++) {
      Contact key = list[i];
      int j = i - 1;

      while (j >= 0 && list[j].fullName.toLowerCase().compareTo(key.fullName.toLowerCase()) > 0) {
        list[j + 1] = list[j];
        j = j - 1;
      }
      list[j + 1] = key;
    }
  }

  void addContact(Contact contact) {
    List<Contact> newList = [...state, contact];
    insertionSort(newList);
    state = newList;
  }

  void deleteContact(int id) {
    // HOHO Linear search, lambat ni harusnya, cuma yaudalah soalnya contactnya ga bakal terlalu banyak

    state = state.where((element) => element.id != id).toList();
  }

  void editContact(Contact contact) {
    deleteContact(contact.id!);
    addContact(contact);
  }
}
