import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddExpense_provider.dart';
import 'addincomepage.dart';
import 'dataprovider.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {



  @override
  Widget build(BuildContext context) {
    final maneyval1 = context.watch<incomedata>() ;
    // Watch listens to changes and triggers a rebuild when notifyListeners() runs


    return Scaffold(
      appBar: AppBar(
        title: Text('Budget'),
        actions: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Addincomepage()));
               },

               child: Text('Add Amount'),style: TextButton.styleFrom(
               backgroundColor: Color.fromRGBO(113, 82, 251,1), // Sets background color
               foregroundColor: Colors.white, // Sets text and icon color
             ),),
           )

        ],
      ),

      body:Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 355,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Optional rounded corners
                  color: Color.fromRGBO(254, 254, 254,1),
                border: Border.all(color: Colors.black12, width: 1.0),

              ),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text('May 2026'),
                          SizedBox(height: 20,),
                          Text('₹ ${maneyval1.balance}',style: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.w500),),
                          Text('Total Budget',style: TextStyle(color: Colors.black54,),)


                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 150.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5,),
                            Stack(
                              alignment: Alignment.center,        // Centers all overlapping items
                              children: [
                                SizedBox(
                                  width:80,
                                  height: 80,
                                  child: CircularProgressIndicator(
                                    value: 0.75,                  // 75% complete
                                    strokeWidth: 5,
                                    color:Color.fromRGBO(113, 82, 251,1) ,
                                    backgroundColor: Colors.grey[300],
                                  ),
                                ),
                                 Text(
                                  '75%',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 10,
                  ),
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('₹ ${maneyval1.income}',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w500),),
                          Text('Income This Month',style: TextStyle(color: Colors.black54,),)



                        ],
                      ),
                      VerticalDivider(),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('₹ ${maneyval1.expence}',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w500),),
                          Text('Spend',style: TextStyle(color: Colors.green,),)



                        ],
                      ),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}



