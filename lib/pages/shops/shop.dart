import 'package:budget_tracker_application/pages/shops/shop_card.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Shops"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ShopCard(
              name: "Black & White Print",
              amount: "Rs. 2",
              image: Image.asset(
                "asset/print.png",
                fit: BoxFit.cover,
              ),
            ),
            ShopCard(
              name: "Colored Print",
              amount: "Rs. 15",
              image: Image.asset(
                "asset/print.png",
                fit: BoxFit.cover,
              ),
            ),
            ShopCard(
              name: "Black & White Print",
              amount: "Rs. 2",
              image: Image.asset(
                "asset/print.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
