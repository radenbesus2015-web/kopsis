import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stokMaksimal;
  final int harga;

  const KeranjangItem({
    super.key,
    required this.stokMaksimal,
    required this.harga,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 18,
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {
                    if (jumlah > 0) jumlah--;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                jumlah.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 18,
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  if (jumlah >= widget.stokMaksimal) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.warning_amber_rounded, color: Colors.white),
                            const SizedBox(width: 8),
                            Text('Stok maksimal: ${widget.stokMaksimal} barang!'),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  } else {
                    setState(() {
                      jumlah++;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        Text(
          'Total: Rp${jumlah * widget.harga}',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
