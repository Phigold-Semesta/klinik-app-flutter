import 'package:flutter/material.dart';
import 'ui/poli_page.dart';
import 'ui/pegawai_page.dart';
import 'ui/pasien_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Klinik App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Latar belakang sedikit abu-abu agar Card menu berwarna putih lebih menonjol
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const Beranda(),
    );
  }
}

// Halaman Beranda sebagai menu utama
class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sistem Informasi Klinik',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        // Ujung bawah AppBar melengkung untuk kesan dinamis
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Selamat Datang,',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pilih menu manajemen data di bawah ini.',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 30),

              // Menggunakan GridView untuk tata letak horizontal (2 kolom)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // Jumlah kotak menyamping
                  crossAxisSpacing: 16, // Jarak horizontal antar kotak
                  mainAxisSpacing: 16, // Jarak vertikal antar kotak
                  childAspectRatio:
                      0.95, // Proporsi kotak (lebar berbanding tinggi)
                  children: [
                    _buildGridCard(
                      context: context,
                      title: 'Data Poli',
                      icon: Icons.local_hospital_rounded,
                      page: const PoliPage(),
                    ),
                    _buildGridCard(
                      context: context,
                      title: 'Data Pegawai',
                      icon: Icons.badge_rounded,
                      page: const PegawaiPage(),
                    ),
                    _buildGridCard(
                      context: context,
                      title: 'Data Pasien',
                      icon: Icons.people_alt_rounded,
                      page: const PasienPage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat tombol menu dalam bentuk Grid Card kotak besar
  Widget _buildGridCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Widget page,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      // Menambahkan efek bayangan lembut khas desain mewah
      elevation: 4,
      shadowColor: Colors.blue.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon besar di tengah kotak
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.blue, size: 40),
              ),
              const SizedBox(height: 16),
              // Teks nama menu
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
