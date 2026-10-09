import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;

  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          title: Text(pasien.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('No. RM: ${pasien.nomorRm}'),
        ),
      ),
      onTap: () {
        // Halaman Detail Pasien
      },
    );
  }
}