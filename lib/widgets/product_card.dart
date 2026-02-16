import 'package:flutter/material.dart';
import '../models/urun.dart';

class ProductCard extends StatelessWidget {
  final Urun urun;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.urun,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Stack(
          children: [
            Column(
              children: [

                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      urun.resimUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  urun.ad,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 4),

                Text(
                  urun.fiyat,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),

            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  urun.isFavori
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: onFavoriteToggle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
