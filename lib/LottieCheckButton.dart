import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCheckButton extends StatefulWidget {
  const LottieCheckButton({Key? key}) : super(key: key);

  @override
  State<LottieCheckButton> createState() => _LottieCheckButtonState();
}

class _LottieCheckButtonState extends State<LottieCheckButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6F56E8)),
      onPressed: () {
        if (!_isClicked) {
          setState(() => _isClicked = true);
          _controller.forward(); // Plays the Lottie checkmark animation
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_isClicked ? "Done" : "Submit"),
          const SizedBox(width: 8),
          SizedBox(
            width: 24,
            height: 24,
            child: Lottie.asset(
              'assets/lotties/successfully-done.json',
              controller: _controller,
              animate: false, // Prevents autoplaying on startup
            ),
          ),
        ],
      ),
    );
  }
}