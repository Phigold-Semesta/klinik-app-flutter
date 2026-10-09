import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_item.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> daftarPasien = [
    Pasien(id: 1, nomorRm: 'RM-001', nama: 'Budi Santoso', tanggalLahir: '1990-01-01', nomorTelepon: '0898765432', alamat: 'Karawang'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Pasien'), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: daftarPasien.length,
        itemBuilder: (context, index) {
          return PasienItem(pasien: daftarPasien[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final Pasien? pasienBaru = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PasienForm()),
          );
          if (pasienBaru != null) {
            setState(() {
              pasienBaru.id = daftarPasien.length + 1;
              daftarPasien.add(pasienBaru);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}