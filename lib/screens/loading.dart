import 'package:flutter/material.dart';
import 'package:flutter_application_20/services/loja_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  final LojaService service;
  const Loading({super.key, required this.service});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setupService();
  }

  Future<void> setupService() async {
    await widget.service.getProducts();
    await widget.service.getProductDetails();

    Navigator.pushReplacementNamed(
      context,
      widget.service.nextRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return const Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.cyanAccent,
        ),
      ),
    );
  }
}
