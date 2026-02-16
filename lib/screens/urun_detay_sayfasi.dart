import 'package:flutter/material.dart';

class UrunDetaySayfasi extends StatelessWidget {
  final String urunAdi;
  final String fiyat;

  const UrunDetaySayfasi({
    super.key,
    required this.urunAdi,
    required this.fiyat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürün Detayı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              urunAdi,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              fiyat,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
