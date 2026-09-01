import 'package:flutter/material.dart';
import 'barang_card.dart';

final List<Map<String, dynamic>> daftarBarang = [
  {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40, 'kategori': 'atk', 'ikon': Icons.menu_book},
  {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25, 'kategori': 'atk', 'ikon': Icons.edit},
  {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15, 'kategori': 'makanan', 'ikon': Icons.bakery_dining},
  {'nama': 'Air Mineral', 'anggota': 3000, 'umum': 3500, 'stok': 0, 'kategori': 'minuman', 'ikon': Icons.local_drink},
  {'nama': 'Penggaris', 'anggota': 4000, 'umum': 4500, 'stok': 10, 'kategori': 'atk', 'ikon': Icons.straighten},
  {'nama': 'Pensil', 'anggota': 1500, 'umum': 2000, 'stok': 30, 'kategori': 'atk', 'ikon': Icons.create},
  {'nama': 'Penghapus', 'anggota': 1000, 'umum': 1500, 'stok': 20, 'kategori': 'atk', 'ikon': Icons.auto_fix_high},
  {'nama': 'Mie Instan', 'anggota': 3500, 'umum': 4000, 'stok': 50, 'kategori': 'makanan', 'ikon': Icons.ramen_dining},
  {'nama': 'Tisu', 'anggota': 4500, 'umum': 5000, 'stok': 12, 'kategori': 'lainnya', 'ikon': Icons.cleaning_services},
  {'nama': 'Stapler', 'anggota': 15000, 'umum': 17000, 'stok': 5, 'kategori': 'atk', 'ikon': Icons.push_pin},
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KopsisPage(),
    );
  }
}

// Komponen Halaman Utama (Stateless)
class KopsisPage extends StatelessWidget {
  const KopsisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final barangTersedia = daftarBarang.where((b) => b['stok'] > 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Koperasi Sekolah'),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: barangTersedia.length,
        itemBuilder: (context, index) {
          final barang = barangTersedia[index];

          if (barang['stok'] < 20) {
            return BarangCard(
              nama: barang['nama'],
              kategori: barang['kategori'] ?? 'Lainnya',
              hargaAnggota: barang['anggota'],
              stok: barang['stok'],
              ikon: barang['ikon'],
              sorot: true,
            );
          } else {
            return BarangCard(
              nama: barang['nama'],
              kategori: barang['kategori'] ?? 'Lainnya',
              hargaAnggota: barang['anggota'],
              stok: barang['stok'],
              ikon: barang['ikon'],
            );
          }
        },
      ),
    );
  }
}
