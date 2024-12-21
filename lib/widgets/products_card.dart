import 'package:flutter/material.dart';
import 'package:flutter_application_20/data_objects/product.dart';
import 'package:flutter_application_20/services/loja_service.dart';

class ProductCard extends StatelessWidget {
  final LojaService service;
  final Product product;
  final Function() showDetails;

  const ProductCard({
    super.key,
    required this.product,
    required this.showDetails,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    String imgUrl = "${service.baseUrl}${product.img}";
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(
            product.name,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
          leading: Image.network(imgUrl),
          onTap: showDetails,
        ),
      ),
    );
  }
}
