import 'package:flutter/material.dart';

import 'shop_card.dart';

class ShopDetailsPage extends StatelessWidget {
  final String name;
  final String amount;
  const ShopDetailsPage({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Shops Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Card

          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  offset: Offset(0, 2), // Shadow offset
                  blurRadius: 4, // Shadow blur radius
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Image.asset(
                  'asset/shop.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      amount,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    // Rate Column
                  ],
                ),
              ),
            ),
          ),

          //Available At:
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Available At",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: ShopCard(
                name: "Near Food Republic",
                amount: "Block C1",
                image: Image.asset(
                  "asset/print.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
