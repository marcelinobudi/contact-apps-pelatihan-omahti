import 'package:contacts/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts/providers/contact_list_provider.dart';
import 'package:contacts/screens/edit_contact.dart';

class ContactDetailsScreen extends ConsumerWidget {
  const ContactDetailsScreen({super.key, required this.contact});
  
  // Data dari list 
  final Contact contact; 

  // Fungsi untuk memunculkan pop-up konfirmasi hapus (Event Handling Delete)
  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hapus Kontak'),
        content: Text('Yakin ingin menghapus ${contact.firstName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              ref.read(contactListProvider.notifier).deleteContact(contact.id!);
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.firstName),
        actions: [
          // TOMBOL EDIT
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              // Navigasi ke halaman Edit
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContactScreen(contact: contact),
                ),
              );
            },
          ),
          // TOMBOL DELETE
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              _showDeleteDialog(context, ref); // pop-up konfirmasi
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            // FOTO PROFIL (AVATAR)
            CircleAvatar(
              radius: 60,
              backgroundColor: contact.photoProfilColor,
              child: Text(
                contact.initialName, 
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),

            // NAMA LENGKAP
            Text(
              contact.fullName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // INFO NOMOR PONSEL
            _buildCustomCard(
              context,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+${contact.number}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('Ponsel', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.phone_outlined)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16),

            // MENU WHATSAPP & MEET
            _buildCustomCard(
              context,
              child: Column(
                children: [
                  _buildMenuRow('WhatsApp'),
                  Divider(height: 1, color: Colors.white54),
                  _buildMenuRow('Meet'),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildCustomCard(
              context,
              child: Column(
                children: [
                  _buildMenuRow('Jawab Otomatis AI'),
                  Divider(height: 1, color: Colors.white54),
                  _buildMenuRow('Ringkasan Panggilan'),
                  Divider(height: 1, color: Colors.white54),
                  _buildMenuRow('Rekaman Panggilan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Membuat latar belakang (kotak pastel)
  Widget _buildCustomCard(BuildContext context, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget _buildMenuRow(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}