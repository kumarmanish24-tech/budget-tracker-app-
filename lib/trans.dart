import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Dbhelper2.dart';
import 'Dbhelper.dart';
import 'dataprovider.dart';

class trans extends StatefulWidget {
  const trans({Key? key}) : super(key: key);

  @override
  State<trans> createState() => _transState();



}

class _transState extends State<trans> {

  void _refreshUI() {
    setState(() {}); // Sirf setState call karne se FutureBuilder dubara run hoga
  }

  void initState() {
    super.initState();
    // Screen load hote hi background mein data fetch karne ke liye trigger lagayein
    Future.microtask(() {
      context.read<incomedata>().refreshData();
    });
  }




  @override
  Widget build(BuildContext context) {
    final datapro = context.watch<incomedata>();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
          bottom:  TabBar(
            tabs: <Widget>[
              Tab(text: 'All',icon: Icon(Icons.apps)),
              Tab(text: 'Income',icon: Icon(Icons.trending_up)),
              Tab(text: 'Expense',icon: Icon(Icons.trending_down)),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Center( child: Text("It's cloudy here")),
            Center(child: Column(
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

            )),
            Center(child: Column(
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
                        'Total Expense',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 10),

                      // 🔥 YAHAN DIRECT TEXT KE ANDAR WIDGET BANAYA
                      FutureBuilder<double>(
                        future: DBHelper2.getTotalIncome(), // Alag banaya hua function call kiya
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

                datapro.allRecords.isEmpty
                ? const Expanded(child: Center(
                  child: Text("No record found")
                )):Expanded(child: ListView.builder(
                    itemCount: datapro.allRecords.length,
                    itemBuilder: (context,index){
                      
                      var record = datapro.allRecords[index];


                      var incomeValue = record[DBHelper2.colIncome.toString()];
                      var dateValue = record['record_date'];
                      var note = record['note'];
                      var cate = record['category'];
                      var ID = record['id'];



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

                              color: Colors.redAccent.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.trending_down_outlined, color: Colors.redAccent),
                          ),
                          // Read Income Amount
                          title: Text(
                            '₹ ${incomeValue}',
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                          ),
                          // Read Notes and Date
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                cate?? 'No Notes',
                                style: const TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                note,
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                          // Delete Button (Optional)
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_sweep_outlined, color: Colors.redAccent),
                            onPressed: () async {
                              await DBHelper2.deleteRecord(ID);
                              _refreshUI();
                              if (mounted) {
                                context.read<incomedata>().refreshData();
                              }// Delete hote hi screen refresh
                            },
                          ),
                        ),
                      );
                      
                      
                      // return ListTile(
                      //   title: Text(incomeValue != null ? incomeValue.toString() : '0.00'),
                      //   subtitle:  Text(dateValue != null ? dateValue.toString() : 'No Date'),
                      // );
                      
                      
                    }))



                // Container(
                //   width: 355,
                //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //   padding: const EdgeInsets.all(24),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(24),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         'Total Expense',
                //         style: TextStyle(color: Colors.grey, fontSize: 14),
                //       ),
                //       const SizedBox(height: 10),
                //
                //
                //       FutureBuilder<double>(
                //         future: DBHelper2.getTotalIncome(), // Alag banaya hua function call kiya
                //         builder: (context, snapshot) {
                //           // Jab tak database calculation kar raha hai
                //           if (snapshot.connectionState == ConnectionState.waiting) {
                //             return const SizedBox(
                //               height: 20,
                //               width: 20,
                //               child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF06B6D4)),
                //             );
                //           }
                //
                //           // Value milne par direct text me print
                //           final total = snapshot.data ?? 0.0;
                //           return Text(
                //             '₹ ${total.toStringAsFixed(2)}',
                //             style: const TextStyle(
                //               color: Colors.black,
                //               fontSize: 30,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),



                // Expanded(
                //   child: FutureBuilder<List<Map<String, dynamic>>>(
                //     future: DBHelper2.getAllRecords(), // DBHelper se saara data mangwaya
                //     builder: (context, snapshot) {
                //
                //       // Case A: Agar data abhi load ho raha hai
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return const Center(child: CircularProgressIndicator(color: Color(0xFF06B6D4)));
                //       }
                //
                //       // Case B: Agar database khali hai ya koi data nahi mila
                //       if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //         return const Center(
                //           child: Text(
                //             'No income records found.',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(color: Colors.grey, fontSize: 16),
                //           ),
                //         );
                //       }
                //
                //       // Case C: Jab data successfully read ho gaya ho
                //       final incomeList = snapshot.data!;
                //
                //
                //
                //       return ListView.builder(
                //         padding: const EdgeInsets.all(5),
                //         itemCount: incomeList.length,
                //         itemBuilder: (context, index) {
                //           final item = incomeList[index];
                //
                //           return Container(
                //             margin: const EdgeInsets.only(bottom: 2),
                //
                //             decoration: BoxDecoration(
                //               // color: Color.fromRGBO(113, 82, 251,1),
                //
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(12),
                //             ),
                //             child: ListTile(
                //               leading: Container(
                //                 padding: const EdgeInsets.all(10),
                //                 decoration: BoxDecoration(
                //
                //                   color: Colors.redAccent.withOpacity(0.1),
                //                   shape: BoxShape.circle,
                //                 ),
                //                 child: const Icon(Icons.trending_down_outlined, color: Colors.redAccent),
                //               ),
                //               // Read Income Amount
                //               title: Text(
                //                 '-₹ ${item[DBHelper2.colIncome].toStringAsFixed(2)}',
                //                 style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                //               ),
                //               // Read Notes and Date
                //               subtitle: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const SizedBox(height: 4),
                //                   Text(
                //                     item[DBHelper2.colcategory] ?? 'No Notes',
                //                     style: const TextStyle(color: Colors.black54),
                //                   ),
                //                   const SizedBox(height: 2),
                //                   Text(
                //                     item[DBHelper2.colDate],
                //                     style: const TextStyle(color: Colors.grey, fontSize: 12),
                //                   ),
                //                 ],
                //               ),
                //               // Delete Button (Optional)
                //               trailing: IconButton(
                //                 icon: const Icon(Icons.delete_sweep_outlined, color: Colors.redAccent),
                //                 onPressed: () async {
                //                   await DBHelper2.deleteRecord(item[DBHelper2.colId]);
                //                   _refreshUI(); // Delete hote hi screen refresh
                //                 },
                //               ),
                //             ),
                //           );
                //         },
                //       );
                //     },
                //   ),
                // ),
              ],

            )),
          ],
        ),
      ),
    );
  }
}