import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  List<Poli> daftarPoli = [
    Poli(id: 1, namaPoli: 'Poli Anak'),
    Poli(id: 2, namaPoli: 'Poli Kandungan'),
    Poli(id: 3, namaPoli: 'Poli Gigi'),
    Poli(id: 4, namaPoli: 'Poli THT'),
  ];

  void tambahPoli(Poli poli) {
    setState(() {
      poli.id = daftarPoli.length + 1;
      daftarPoli.add(poli);
    });
  }

  void hapusPoli(int id) {
    setState(() {
      daftarPoli.removeWhere((poli) => poli.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Poli'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: daftarPoli.length,
        itemBuilder: (context, index) {
          final poli = daftarPoli[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(poli.namaPoli, style: const TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PoliDetail(
                      poli: poli,
                      onDelete: () {
                        hapusPoli(poli.id);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final poli = await Navigator.push<Poli>(
            context,
            MaterialPageRoute(builder: (context) => const PoliForm()),
          );
          if (poli != null) {
            tambahPoli(poli);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}