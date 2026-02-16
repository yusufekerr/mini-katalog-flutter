class Urun {
  final String ad;
  final String fiyat;
  final String resimUrl;
  bool isFavori;

  Urun({
    required this.ad,
    required this.fiyat,
    required this.resimUrl,
    this.isFavori = false,
  });

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      ad: json['ad'],
      fiyat: json['fiyat'],
      resimUrl: json['resimUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ad': ad,
      'fiyat': fiyat,
      'resimUrl': resimUrl,
      'isFavori': isFavori,
    };
  }
}
