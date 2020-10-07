import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final _oldFavorite = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = "https://shopapp-fb14b.firebaseio.com/products/$id.json";

    try {
      final _response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (_response.statusCode >= 400) {
        _setFavValue(_oldFavorite);
      }
    } catch (error) {
      _setFavValue(_oldFavorite);
    }
  }
}
