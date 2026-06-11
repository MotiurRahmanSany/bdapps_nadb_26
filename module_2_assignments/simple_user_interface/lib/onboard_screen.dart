import 'package:flutter/material.dart';
import 'package:simple_user_interface/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to ensure proper padding across different device notches
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          24.0,
          statusBarHeight + 20.0,
          24.0,
          bottomPadding + 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Make every day\na learning\njourney',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.15,
                fontFamily: 'Sans-Serif',
              ),
            ),

            Expanded(
              child: Center(
                child: Image.asset(
                  Constants.bgImg,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            const Text(
              'An engaging way to master new languages\nand connect with cultures worldwide',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 40),

            // Call to Action Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C78D3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(width: 24),
                    Text(
                      'Start Learning',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
