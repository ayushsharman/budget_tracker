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
        body: Column(
          children: [
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
            )
          ],
        ));
  }
}
