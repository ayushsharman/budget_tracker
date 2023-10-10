import 'package:flutter/material.dart';

class ShopDetailsPage extends StatelessWidget {
  const ShopDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Shops Details"),
      ),
    );
  }
}
