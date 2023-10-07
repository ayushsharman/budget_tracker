import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.monetization_on,
              size: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Expense Tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Track and manage your expenses with ease.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the main expense tracker screen
                    // You can use Navigator.push() to navigate to your main app screen.
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color
                    onPrimary: Colors.white, // Text color
                    elevation: 5, // Shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius as needed
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
