import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;

  const PegawaiItem({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          title: Text(pegawai.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('NIP: ${pegawai.nip}'),
        ),
      ),
      onTap: () {
        // Navigasi ke PegawaiDetail (Bisa dilanjutkan nanti seperti PoliDetail)
      },
    );
  }
}