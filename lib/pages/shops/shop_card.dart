import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String name;
  final String amount;
  final Image image;
  final VoidCallback? onPressed;

  ShopCard({
    Key? key,
    required this.name,
    required this.amount,
    required this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
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
                    child: image,
                  ),
                ),
              ),

              // Rate Column
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      amount,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
