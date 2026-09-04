import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final String kategori;
  final int hargaAnggota;
  final int hargaUmum;
  final int stok;
  final IconData ikon;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.kategori,
    required this.hargaAnggota,
    required this.hargaUmum,
    required this.stok,
    required this.ikon,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sorot ? Colors.yellow[100] : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(ikon, color: Colors.blue, size: 28),
          ),
          title: Text(
            nama,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  kategori.toUpperCase(),
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Anggota: Rp$hargaAnggota',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Umum: Rp$hargaUmum',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          trailing: KeranjangItem(
            stokMaksimal: stok,
            harga: hargaAnggota,
          ),
        ),
      ),
    );
  }
}
