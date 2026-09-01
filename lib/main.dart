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

class KopsisPage extends StatefulWidget {
  const KopsisPage({super.key});

  @override
  State<KopsisPage> createState() => _KopsisPageState();
}

class _KopsisPageState extends State<KopsisPage> {
  late TextEditingController _controller;
  String kataCari = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasilCari = daftarBarang
        .where((b) => b['stok'] > 0 && b['nama'].toLowerCase().contains(kataCari))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Koperasi Sekolah',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Cari barang...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: kataCari.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _controller.clear();
                            kataCari = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: hasilCari.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'Barang tidak ditemukan',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: hasilCari.length,
                    itemBuilder: (context, index) {
                      final barang = hasilCari[index];
                      return BarangCard(
                        nama: barang['nama'],
                        kategori: barang['kategori'] ?? 'Lainnya',
                        hargaAnggota: barang['anggota'],
                        hargaUmum: barang['umum'],
                        stok: barang['stok'],
                        ikon: barang['ikon'],
                        sorot: barang['stok'] < 20,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
