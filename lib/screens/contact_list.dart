import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Column(
        children: [TextButton(onPressed: () {}, child: Text('Filled'))],
      ),
    );
  }
}
