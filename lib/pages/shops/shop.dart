import 'package:budget_tracker_application/pages/shops/shop_card.dart';
import 'package:budget_tracker_application/pages/shops/shop_details_page.dart';
import 'package:card_swiper/card_swiper.dart';
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopDetailsPage(
                        name: "Black & White Print",
                        amount: "Rs. 2",
                      ),
                    ));
              },
              name: "Black & White Print",
              amount: "Rs. 2",
              image: Image.asset(
                "asset/print.png",
                fit: BoxFit.cover,
              ),
            ),
            ShopCard(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopDetailsPage(
                        name: "Colored Print",
                        amount: "Rs. 15",
                      ),
                    ));
              },
              name: "Colored Print",
              amount: "Rs. 15",
              image: Image.asset(
                "asset/print.png",
                fit: BoxFit.cover,
              ),
            ),
            ShopCard(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopDetailsPage(
                        name: "Black & White Print",
                        amount: "Rs. 2",
                      ),
                    ));
              },
              name: "Black & White Print",
              amount: "Rs. 2",
              image: Image.asset(
                "asset/print.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                    20.0), // Set your desired border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    // Replace placeholder image with the two images
                    List<String> images = [
                      "asset/save money.png",
                      "asset/print shop.png",
                    ];

                    return Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount:
                      2, // Adjust the itemCount to match the number of images
                  pagination: const SwiperPagination(),
                  autoplay: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
