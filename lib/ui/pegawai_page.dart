import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_item.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  List<Pegawai> daftarPegawai = [
    Pegawai(
      id: 1,
      nip: '19232083',
      nama: 'Farid Abdul Kholiq',
      tanggalLahir: '2004-12-19',
      nomorTelepon: '0812345678',
      email: 'farid@klinik.com',
      password: '123',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pegawai'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: daftarPegawai.length,
        itemBuilder: (context, index) {
          // Memanggil Class Item yang sudah dipisah
          return PegawaiItem(pegawai: daftarPegawai[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final Pegawai? pegawaiBaru = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PegawaiForm()),
          );
          if (pegawaiBaru != null) {
            setState(() {
              pegawaiBaru.id = daftarPegawai.length + 1;
              daftarPegawai.add(pegawaiBaru);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
