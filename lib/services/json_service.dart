import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/urun.dart';

class JsonService {

  static Future<List<Urun>> urunleriYukle() async {
    final String response =
        await rootBundle.loadString('assets/data/urunler.json');

    final List<dynamic> data = json.decode(response);

    return data.map((json) => Urun.fromJson(json)).toList();
  }

}
