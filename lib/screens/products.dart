import 'package:flutter/material.dart';
import 'package:flutter_application_20/data_objects/product.dart';
import 'package:flutter_application_20/services/loja_service.dart';
import 'package:flutter_application_20/widgets/products_card.dart';

class Products extends StatefulWidget {
  final LojaService service;
  const Products({super.key, required this.service});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  void showDetails(Product product) {
    widget.service.productId = product.id;
    Navigator.pushNamed(context, "/loadingDetails");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loja de Música"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.service.products.length,
              itemBuilder: (context, index) => ProductCard(
                product: widget.service.products[index],
                showDetails: () {
                  showDetails(widget.service.products[index]);
                },
                service: widget.service,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
