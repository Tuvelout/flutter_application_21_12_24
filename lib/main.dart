import 'package:flutter/material.dart';
import 'package:flutter_application_20/screens/loading.dart';
import 'package:flutter_application_20/screens/product_details.dart';
import 'package:flutter_application_20/screens/products.dart';
import 'package:flutter_application_20/services/loja_service.dart';

void main() {
  LojaService service = LojaService();
  runApp(MaterialApp(
    initialRoute: '/loadingProducts',
    routes: {
      '/loadingProducts': (context) {
        service.nextRoute = "/products";
        return Loading(service: service);
      },
      '/products': (context) => Products(service: service),
      '/loadingDetails': (context) {
        service.nextRoute = "/details";
        return Loading(service: service);
      },
      '/details': (context) => ProductDetails(service: service),
    },
  ));
}
