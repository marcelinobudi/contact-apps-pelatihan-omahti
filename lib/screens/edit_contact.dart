import 'package:contacts/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts/providers/contact_list_provider.dart';

class EditContactScreen extends ConsumerStatefulWidget {
  const EditContactScreen({super.key, required this.contact});
  final Contact contact;

  @override
  ConsumerState<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends ConsumerState<EditContactScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaDepanController = TextEditingController();
  final TextEditingController namaBelakangController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  void dispose() {
    namaDepanController.dispose();
    namaBelakangController.dispose();
    nomorController.dispose();
    emailController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  void simpanKontakBaru() {
    if (_formKey.currentState!.validate()) {
      widget.contact.editContact(
        firstName: namaDepanController.text.trim(),
        lastName: namaBelakangController.text.trim(),
        number: nomorController.text.trim(),
        email: emailController.text.trim(),
        homeAddress: alamatController.text.trim()
      );
      ref.read(contactListProvider.notifier).editContact(widget.contact);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    namaDepanController.text = widget.contact.firstName;
    namaBelakangController.text = widget.contact.lastName;
    nomorController.text = widget.contact.number;
    emailController.text = widget.contact.email??'';
    alamatController.text = widget.contact.homeAddress??'';

  }

  @override
  Widget build(BuildContext context) {
    final warnaTema = Theme.of(context).colorScheme.primary;
    print(widget.contact.firstName);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: warnaTema),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Kontak',
          style: TextStyle(color: warnaTema, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: warnaTema),
            onPressed: () => simpanKontakBaru(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(Icons.person, size: 50, color: warnaTema),
              ),
              const SizedBox(height: 40),

              // Pakai TextFormField
              TextFormField(
                controller: namaDepanController,
                decoration: InputDecoration(
                  labelText: 'Nama Depan',
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: warnaTema)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama Depan wajib diisi!';
                  }
                  return null; // Kalau null berarti aman/valid
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: namaBelakangController,
                // initialValue: widget.contact.lastName,
                decoration: InputDecoration(
                  labelText: 'Nama Belakang',
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: warnaTema)),
                ),
                // Nama belakang nggak wajib
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: nomorController,
                // initialValue: widget.contact.number,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Nomor Ponsel',
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: warnaTema)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nomor Ponsel wajib diisi!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: emailController,
                // initialValue: widget.contact.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Alamat Email',
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: warnaTema)),
                ),
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: alamatController,
                // initialValue: widget.contact.homeAddress,
                decoration: InputDecoration(
                  labelText: 'Alamat Rumah',
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: warnaTema)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}