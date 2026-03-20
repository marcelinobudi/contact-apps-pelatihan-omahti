import 'package:contacts/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItemTile extends StatelessWidget {
  const ContactItemTile({super.key, required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 42,
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: contact.photoProfilColor,
              ),
              alignment: .center,
              child: Text(
                contact.initialName,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              mainAxisSize: .max,
              children: [
                Text(
                  contact.fullName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '+${contact.number}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
