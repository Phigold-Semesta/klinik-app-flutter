import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  void _simpan() {
    if (_namaCtrl.text.isEmpty) return;
    final pasienBaru = Pasien(
      nomorRm: _nomorRmCtrl.text,
      nama: _namaCtrl.text,
      tanggalLahir: _tglLahirCtrl.text,
      nomorTelepon: _telpCtrl.text,
      alamat: _alamatCtrl.text,
    );
    Navigator.pop(context, pasienBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Pasien'), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nomorRmCtrl, decoration: const InputDecoration(labelText: 'Nomor RM', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: _namaCtrl, decoration: const InputDecoration(labelText: 'Nama Pasien', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: _tglLahirCtrl, decoration: const InputDecoration(labelText: 'Tanggal Lahir', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: _telpCtrl, decoration: const InputDecoration(labelText: 'Nomor Telepon', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: _alamatCtrl, decoration: const InputDecoration(labelText: 'Alamat', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpan,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}