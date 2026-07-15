import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentButtonScreen extends StatelessWidget {
  const PaymentButtonScreen({Key? key}) : super(key: key);

  // Function to display the animated popup
  void _showSuccessPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // Prevents closing by tapping outside during animation
      barrierLabel: '',
      barrierColor: Colors.black54, // Dims the background screen
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, anim, anim2, child) {
        // Smooth scale transition for the popup box
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
          child: AlertDialog(
            backgroundColor: const Color(0xFFF9F8FD), // Matches MyPocket theme
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min, // Constrains the height to its content
              children: [
                const SizedBox(height: 16),
                // Lottie Asset
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Lottie.asset(
                    'assets/lotties/successfully-done.json', // Replace with your checkmark path
                    repeat: false, // Plays only once
                    onLoaded: (composition) {
                      // Automatically closes the popup when the animation completes
                      Future.delayed(composition.duration, () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F56E8),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Transaction completed.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6F56E8),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () => _showSuccessPopup(context), // Triggers popup
          child: const Text(
            "Pay Now",
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}