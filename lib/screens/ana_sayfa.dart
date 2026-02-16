import 'package:flutter/material.dart';
import '../models/urun.dart';
import '../services/json_service.dart';
import '../widgets/product_card.dart';
import 'urun_detay_sayfasi.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  List<Urun> urunler = [];

  @override
  void initState() {
    super.initState();
    verileriYukle();
  }

  Future<void> verileriYukle() async {
    final yuklenenUrunler = await JsonService.urunleriYukle();

    setState(() {
      urunler = yuklenenUrunler;
    });
  }

  void toggleFavori(Urun urun) {
    setState(() {
      urun.isFavori = !urun.isFavori;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog"),
        centerTitle: true,
      ),
      body: urunler.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: urunler.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {

                final urun = urunler[index];

                return ProductCard(
                  urun: urun,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UrunDetaySayfasi(
                          urunAdi: urun.ad,
                          fiyat: urun.fiyat,
                        ),
                      ),
                    );
                  },

                  onFavoriteToggle: () {
                    toggleFavori(urun);
                  },
                );
              },
            ),
    );
  }
}
