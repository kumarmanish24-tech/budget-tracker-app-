import 'package:ex27/AddExpense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex27/addincomepage.dart';
import 'dataprovider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {





@override
  Widget build(BuildContext context) {

    final transdata = context.watch<Category>();
    final moneyval = context.watch<incomedata>();

    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 242, 254,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 242, 254,1),
        title:  Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hey,Riya 👋 ',style: TextStyle(color: Color.fromRGBO(23, 30, 62,1)),),
          Text('Good Morning',style: TextStyle(fontSize: 15,color: Color.fromRGBO(23, 30, 62,1)),),
        ],
      ),



        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none))],
      ),
      body:Center(child:
        Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 190 ,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Optional rounded corners
                // gradient: LinearGradient(
                //   begin: Alignment.bottomCenter, // Where the gradient starts
                //   end: Alignment.topCenter, // Where the gradient ends
                //   colors: [
                //     Color.fromRGBO(91, 81, 219,1), // Starting color
                //     Color.fromRGBO(129, 99, 242,0.8), // Ending color
                //   ],
                //   stops: [0.0, 1.0], // Optional distribution mapping
                // ),
                image: DecorationImage(
                  image: AssetImage("assets/bg/bg1.png"), // Or NetworkImage("url")
                  fit: BoxFit.cover, // Crops and fills the container bounds
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Total Balance',style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.w700),),
                          Text('₹${moneyval.balance}',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),)
                        ],
                      )
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('This Month Income', style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w700)),
                            Text('₹ ${moneyval.income}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        ),

                        // 2. The VerticalDivider stays clean inside the Row without its own IntrinsicHeight wrapper
                        VerticalDivider(
                          thickness: 2,
                          color: Colors.white,
                          width: 20,
                          indent: 5,
                          endIndent: 5,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Expenses', style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w700)),
                            Text('₹ ${moneyval.expence}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 424 ,
              width: 350,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Optional rounded corners
                      color: Color.fromRGBO(254, 254, 254,1)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 15,),

                            Text("Today's Spending",style: TextStyle(fontSize: 15,color: Color.fromRGBO(28, 32, 70,1),),),
                            SizedBox(width: 150,),
                            Text('View All',style: TextStyle(color: Colors.blue),),
                            SizedBox(width: 5,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 15,),
                            Text("₹ 320.00",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),

                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Text("Quick Actions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(25, 35, 79,1),),),

                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(height: 75,
                    width: 350,

                    decoration: BoxDecoration(
                         // color: Color.fromRGBO(254, 254, 254,1),
                      borderRadius: BorderRadius.circular(12),
                    ),


                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [

                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Addincomepage()));
                          },



                          child: Container(
                            height: 75,
                            width: 65,
                            decoration: BoxDecoration(
                               // color: Color.fromRGBO(113, 82, 251,1),
                               color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0), // Padding around icon
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(235, 228, 253,1) ,// Background color
                                    borderRadius: BorderRadius.circular(50), // Rounded corners
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(108, 74, 240,1),
                                    size: 24.0,
                                  ),
                                ),
                                Text('Add Amount',style: TextStyle(color: Colors.black87,fontSize: 10),),
                              ],
                            ),
                          ),

                        ),

                        Container(
                          height: 75,
                          width: 65,
                          decoration: BoxDecoration(
                            // color: Color.fromRGBO(113, 82, 251,1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0), // Padding around icon
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(235, 228, 253,1) ,// Background color
                                  borderRadius: BorderRadius.circular(50), // Rounded corners
                                ),
                                child: const Icon(
                                  Icons.coffee,
                                  color: Color.fromRGBO(108, 74, 240,1),
                                  size: 24.0,
                                ),
                              ),
                              Text('Food',style: TextStyle(color: Colors.black87,fontSize: 10),),
                            ],
                          ),
                        ),
                        Container(
                          height: 75,
                          width: 65,
                          decoration: BoxDecoration(
                            // color: Color.fromRGBO(113, 82, 251,1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0), // Padding around icon
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(235, 228, 253,1) ,// Background color
                                  borderRadius: BorderRadius.circular(50), // Rounded corners
                                ),
                                child: const Icon(
                                  Icons.price_check,
                                  color: Color.fromRGBO(108, 74, 240,1),
                                  size: 24.0,
                                ),
                              ),
                              Text('Fees',style: TextStyle(color: Colors.black87,fontSize: 10),),
                            ],
                          ),
                        ),
                        Container(
                          height: 75,
                          width: 65,
                          decoration: BoxDecoration(
                            // color: Color.fromRGBO(113, 82, 251,1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0), // Padding around icon
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(235, 228, 253,1) ,// Background color
                                  borderRadius: BorderRadius.circular(50), // Rounded corners
                                ),
                                child: const Icon(
                                  Icons.directions_bus,
                                  color: Color.fromRGBO(108, 74, 240,1),
                                  size: 24.0,
                                ),
                              ),
                              Text('Transport',style: TextStyle(color: Colors.black87,fontSize: 10),),
                            ],
                          ),
                        ),
                        Container(
                          height: 75,
                          width: 65,
                          decoration: BoxDecoration(
                            // color: Color.fromRGBO(113, 82, 251,1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0), // Padding around icon
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(235, 228, 253,1) ,// Background color
                                  borderRadius: BorderRadius.circular(50), // Rounded corners
                                ),
                                child: const Icon(
                                  Icons.movie,
                                  color: Color.fromRGBO(108, 74, 240,1),
                                  size: 24.0,
                                ),
                              ),
                              Text('Entertainment',style: TextStyle(color: Colors.black87,fontSize: 10),),
                            ],
                          ),
                        ),


                      ],

                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Text("Recent Transactions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(25, 35, 79,1),),),

                    ],
                  ),
                  SizedBox(height: 5,),

                  Container(
                    height: 175,
                    width: 355,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 254, 254,1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter, // 🌟 Centers your narrow list inside the wider 355 container
                      child: SizedBox(
                        height: 200, // Matches parent height bounds
                        width: 330,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: transdata.exdata.length,
                          itemBuilder: (context, index) {
                            final sss = transdata.exdata[index];

                            return Container(

                              width: 70, // Explicit width for each card item
                              margin: const EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(
                                 // color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Container(
                                              width: 30, // Explicit width is required
                                              height: 30, // Explicit height must match width to make it a perfect circle
                                              decoration: const BoxDecoration(

                                                // Add color INSIDE decoration if decoration is used
                                                shape: BoxShape.circle, // Makes the container circular 🌟
                                              ),

                                              child: Image.asset(sss.CategotyImage)),

                                          Divider()
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(sss.CategotyName, style: const TextStyle(fontSize: 18, color: Color.fromRGBO(25, 35, 79,1) ,fontWeight: FontWeight.w500)),
                                          Text(sss.date, style: const TextStyle(fontSize: 12, color: Color.fromRGBO(25, 35, 79,1))),
                                        ],
                                      ),
                                      SizedBox(width: 155,),
                                      Column(crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('- ₹${sss.amount}', style: const TextStyle(fontSize: 18, color: Color.fromRGBO(25, 35, 79,1))),
                                          Text(sss.time, style: const TextStyle(fontSize: 10, color: Colors.black54)),
                                        ],
                                      ),


                                    ],
                                  ),
                                  Divider(color: Colors.black12,thickness: 1,)
                                ],
                              ),

                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),





                ],
              ),
            ),


          ],
        ),),

    );
  }
}


extension CapitalizeString on String {
  String get toCapitalized {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

