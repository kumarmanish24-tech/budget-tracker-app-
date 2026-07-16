import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BounceTextPage extends StatefulWidget {
  const BounceTextPage({Key? key}) : super(key: key);

  @override
  State<BounceTextPage> createState() => _BounceTextPageState();
}

class _BounceTextPageState extends State<BounceTextPage> {
  // Controller animation ko control karne ke liye
  final AnimatedTextController _bounceController = AnimatedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Clean background color
      appBar: AppBar(
        title: const Text('Bounce Animation Screen'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Animation Text Display Area
              Expanded(
                child: Center(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 55.0
                        ,
                        color: Colors.indigo,
                        letterSpacing: 2,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText(
                            'BOUNCE',
                            duration: const Duration(milliseconds: 800),
                          ),
                        ],
                        controller: _bounceController,
                        isRepeatingAnimation: false,
                        totalRepeatCount: 1,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Action Button
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      _bounceController.reset();
                      _bounceController.play();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.bolt, size: 28),
                        SizedBox(width: 10),
                        Text(
                          'Animate Text',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
