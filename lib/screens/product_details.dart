import 'package:flutter/material.dart';
import 'package:flutter_application_20/services/loja_service.dart';
import 'package:flutter_application_20/widgets/details.dart';

class ProductDetails extends StatefulWidget {
  final LojaService service;
  const ProductDetails({super.key, required this.service});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Details(service: widget.service);
  }
}
