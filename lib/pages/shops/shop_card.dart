import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  "asset/print.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Rate Column
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Black & White Print",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Rs. 2",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
