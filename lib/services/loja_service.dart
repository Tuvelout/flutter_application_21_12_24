import 'dart:convert';
import 'package:flutter_application_20/data_objects/product.dart';
import 'package:http/http.dart' as http;

class LojaService {
  // Objets pour le chargement
  List<Product> products = [];
  int productId = 0;
  Product productToShow = Product(
    categoryId: 0,
    id: 0,
    name: "NO Product",
    description: "NO Product",
    cost: 0,
    img: "NO Product",
  );

  // Éléments de l'API
  final String baseUrl = "http://127.0.0.1:8000";
  String nextRoute = "/products";

  Future<void> getProducts() async {
    String apiUrl = "http://127.0.0.1:8000/api";
    String address = "$apiUrl/products";
    var url = Uri.parse(address);

    var response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);

    products.clear();

    for (Map element in data) {
      Product product = Product(
        id: element['id'],
        name: element['Name'],
        description: element['Description'],
        categoryId: element['category_id'],
        cost: element['Cost'],
        img: element['img'],
      );
      products.add(
          product); // Il y a une erreur ici, on ajoute product à une liste qui n'existe pas dans cet extrait de code
    }
  }

  Future<void> getProductDetails() async {
    // Si l'identifiant du produit est 0, il n'y a pas de produit à rechercher
    if (productId == 0) return;

    String apiUrl = "http://127.0.0.1:8000/api";
    String address = "$apiUrl/products/$productId";
    var url = Uri.parse(address);

    var response = await http.get(url);
    Map element = jsonDecode(response.body);

    productToShow = Product(
      id: element['id'],
      name: element['Name'],
      description: element['Description'],
      categoryId: element['category_id'],
      cost: element['Cost'],
      img: element['img'],
    );
  }
}
