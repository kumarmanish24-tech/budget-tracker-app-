import 'package:flutter/material.dart';
import 'Dbhelper2.dart'; // Database ka helper import karo

import 'demothiredpage.dart';
import 'Dbhelper.dart';
class IncomeDashboard extends StatefulWidget {
  const IncomeDashboard({super.key});

  @override
  State<IncomeDashboard> createState() => _IncomeDashboardState();
}

class _IncomeDashboardState extends State<IncomeDashboard> {
  // Yeh function humein baar-baar screen refresh karne mein madad karega
  void _refreshUI() {
    setState(() {}); // Sirf setState call karne se FutureBuilder dubara run hoga
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12141C),
      appBar: AppBar(
        title: const Text('My Income History', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      // 1. FUTUREBUILDER: Jo database se data read karega
      body: Column(
        children: [
          Container(
            width: 355,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Income Balance',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 10),

                // 🔥 YAHAN DIRECT TEXT KE ANDAR WIDGET BANAYA
                FutureBuilder<double>(
                  future: DBHelper.getTotalIncome(), // Alag banaya hua function call kiya
                  builder: (context, snapshot) {
                    // Jab tak database calculation kar raha hai
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF06B6D4)),
                      );
                    }

                    // Value milne par direct text me print
                    final total = snapshot.data ?? 0.0;
                    return Text(
                      '₹ ${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),



          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: DBHelper.getAllRecords(), // DBHelper se saara data mangwaya
              builder: (context, snapshot) {

                // Case A: Agar data abhi load ho raha hai
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Color(0xFF06B6D4)));
                }

                // Case B: Agar database khali hai ya koi data nahi mila
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No income records found.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                // Case C: Jab data successfully read ho gaya ho
                final incomeList = snapshot.data!;



                return ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: incomeList.length,
                  itemBuilder: (context, index) {
                    final item = incomeList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),

                      decoration: BoxDecoration(
                        // color: Color.fromRGBO(113, 82, 251,1),

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(

                            color: Colors.greenAccent.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.trending_up_rounded, color: Colors.greenAccent),
                        ),
                        // Read Income Amount
                        title: Text(
                          '₹ ${item[DBHelper.colIncome].toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                        ),
                        // Read Notes and Date
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              item[DBHelper.colNotes] ?? 'No Notes',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item[DBHelper.colDate],
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        // Delete Button (Optional)
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_sweep_outlined, color: Colors.redAccent),
                          onPressed: () async {
                            await DBHelper.deleteRecord(item[DBHelper.colId]);
                            _refreshUI(); // Delete hote hi screen refresh
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],

      )

      // 2. FAB: Naye page par jaane ke liye

    );
  }
}