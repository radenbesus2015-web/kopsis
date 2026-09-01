import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final String kategori;
  final int hargaAnggota;
  final int stok;
  final IconData ikon;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.kategori,
    required this.hargaAnggota,
    required this.stok,
    required this.ikon,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sorot ? Colors.yellow[100] : Colors.white,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(ikon, color: Colors.blue),
        title: Text(nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kategori.toUpperCase(),
              style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text("Anggota Rp\$hargaAnggota"),
          ],
        ),
        trailing: KeranjangItem(
          stokMaksimal: stok,
          harga: hargaAnggota,
        ),
      ),
    );
  }
}
