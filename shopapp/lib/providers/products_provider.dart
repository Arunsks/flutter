import 'package:flutter/material.dart';
import 'package:shopApp/models/http_exception.dart';
import 'products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get showFavorite {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItm) => prodItm.isFavorite).toList();
    // }
    return [..._items];
  }

  // void showFavorites(){
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> fetchProductAndDisplay() async {
    const url = "https://shopapp-fb14b.firebaseio.com/products.json";
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      if(extractData == null){
        return;
      }
      extractData.forEach((key, prodData) {
        loadedProducts.add(
          Product(
              id: key,
              title: prodData['title'],
              description: prodData['description'],
              imageUrl: prodData['imageUrl'],
              isFavorite: prodData['isFavorite'],
              price: prodData['price']),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) async {
    const url = "https://shopapp-fb14b.firebaseio.com/products.json";

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFavorite': product.isFavorite,
        }),
      );

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );

      _items.add(newProduct);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String productId, Product newProduct) async {
    final _prodIndex = _items.indexWhere((prod) => prod.id == productId);
    if (_prodIndex >= 0) {
      final url =
          "https://shopapp-fb14b.firebaseio.com/products/$productId.json";

      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
          }));

      _items[_prodIndex] = newProduct;
    } else {
      print("...");
    }
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url = "https://shopapp-fb14b.firebaseio.com/products/$id.json";
    final exsistingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var exsistingProduct = _items[exsistingProductIndex];
    _items.removeAt(exsistingProductIndex);
    final response = await http.delete(url);
    {
      if (response.statusCode >= 400) {
        _items.insert(exsistingProductIndex, exsistingProduct);
        notifyListeners();
        throw HttpException('Could not delete prodcut');
      }
      exsistingProduct = null;
    }
  }
}
