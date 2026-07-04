import 'dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:ex27/home.dart';
import 'package:ex27/trans.dart';
import 'package:ex27/Addpage.dart';
import 'package:ex27/Budget.dart';
import 'package:provider/provider.dart';
import 'package:ex27/Profile.dart';
import 'package:ex27/AddExpense_provider.dart';

void main() {
  runApp(MultiProvider(providers: [

    ChangeNotifierProvider(create: (context) => Category()),
    ChangeNotifierProvider(create: (context) => incomedata()),
    ChangeNotifierProvider(create: (context) => Addincomedata()),


  ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // The 5 screens mapping to Home, Activity, Addpage (FAB), Budget, Profile
  final List<Widget> _screens = [
    const home(),
    const trans(),

    const BudgetPage(),
     Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 242, 254,1),
      body: _screens[_currentIndex],


      // 1. Add the FloatingActionButton here
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), // Makes it perfectly round
        backgroundColor:Color.fromRGBO(113, 82, 251,1),
        foregroundColor: Colors.white,
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) => Addpage()));

        },
        child: const Icon(Icons.add, size: 28),
      ),

      // 2. Position the FAB directly in the center-docked area
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 3. Swap NavigationBar for BottomAppBar to handle the middle gap beautifully
      bottomNavigationBar: BottomAppBar(
         color: Color.fromRGBO(254, 254, 254,1),

        shape: const CircularNotchedRectangle(), // Creates an optional cutout for the FAB
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Side Navigation Items
              _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
              _buildNavItem(1, Icons.payment, Icons.payment_rounded, 'Activity'),

              // This acts as a blank placeholder to reserve spacing for the FAB
              const SizedBox(width: 40),

              // Right Side Navigation Items
              _buildNavItem(2, Icons.account_balance_wallet_outlined, Icons.account_balance_wallet, 'Budget'),
              _buildNavItem(3, Icons.person_outline, Icons.person, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to keep your navigation action items clean and reusable
  Widget _buildNavItem(int index, IconData unselectedIcon, IconData selectedIcon, String label) {
    final isSelected = _currentIndex == index;
    return InkWell(

      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(

            isSelected ? selectedIcon : unselectedIcon,
            color: isSelected ?Color.fromRGBO(113, 82, 251,1): Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Color.fromRGBO(113, 82, 251,1) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
