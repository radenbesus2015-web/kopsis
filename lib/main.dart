import 'package:flutter/material.dart';

final List<Map<String, dynamic>> daftarBarang = [
  {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40, 'ikon': Icons.menu_book},
  {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25, 'ikon': Icons.edit},
  {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15, 'ikon': Icons.bakery_dining},
  {'nama': 'Air Mineral', 'anggota': 3000, 'umum': 3500, 'stok': 0, 'ikon': Icons.local_drink},
  {'nama': 'Penggaris', 'anggota': 4000, 'umum': 4500, 'stok': 10, 'ikon': Icons.straighten},
  {'nama': 'Pensil', 'anggota': 1500, 'umum': 2000, 'stok': 30, 'ikon': Icons.create},
  {'nama': 'Penghapus', 'anggota': 1000, 'umum': 1500, 'stok': 20, 'ikon': Icons.auto_fix_high},
  {'nama': 'Mie Instan', 'anggota': 3500, 'umum': 4000, 'stok': 50, 'ikon': Icons.ramen_dining},
  {'nama': 'Tisu', 'anggota': 4500, 'umum': 5000, 'stok': 12, 'ikon': Icons.cleaning_services},
  {'nama': 'Stapler', 'anggota': 15000, 'umum': 17000, 'stok': 5, 'ikon': Icons.push_pin},
];

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(barang['ikon'] as IconData),
                title: Text(barang['nama']),
                subtitle: Text('Anggota Rp' + barang['anggota'].toString()),
                trailing: Text('Stok ' + barang['stok'].toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
