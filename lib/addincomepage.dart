import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Dbhelper2.dart';
import 'Dbhelper.dart';
import 'dataproviderforallExpence.dart';
import 'package:provider/provider.dart';


class Addincomepage extends StatefulWidget {
  const Addincomepage({Key? key}) : super(key: key);

  @override
  State<Addincomepage> createState() => _AddincomepageState();
}

class _AddincomepageState extends State<Addincomepage> {


  final _myAmount = TextEditingController();
  final _mynote = TextEditingController();

  @override
  void dispose() {
    _myAmount.dispose();
    _mynote.dispose();
    super.dispose();
  }


  DateTime _selectedDate = DateTime.now();

  // 2. Function to show the calendar picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000), // Earliest date user can pick
      lastDate: DateTime(2101), // Latest date user can pick
    );

    // If user selects a date and clicks OK, update state
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,

        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Income'),
            Text('record your income detail to',style: TextStyle(fontSize: 15,color: Colors.black54),),
            Text('keep track of your finances.',style: TextStyle(fontSize: 15,color: Colors.black54))
          ],


        ),

        actions: [
          IconButton(onPressed: (){}, icon: Image.asset("assets/icons/money-bag.png"))
        ],


      ),


      body: SingleChildScrollView(
        child: SizedBox(height: 650,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 80,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Optional rounded corners
                    color: Color.fromRGBO(254, 254, 254,1),
                    border: Border.all(color: Colors.black12, width: 1.0),

                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(width: 10,),

                      Container(
                        padding: const EdgeInsets.all(8.0), // Padding around icon
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 228, 253,1) ,
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: const Icon(
                          Icons.currency_rupee,
                          color: Color.fromRGBO(108, 74, 240,1), // Icon color
                          size: 24.0,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 5,),
                            Text('Amount',style: TextStyle(fontSize: 15,color: Colors.black54)),
                            Expanded(
                              child: SizedBox(width: 150,
                                child: TextField(
                                  controller: _myAmount,
                                  style: const TextStyle(
                                    fontSize:25.0, // Increase this number to make the text bigger
                                    fontWeight: FontWeight.w500, // Optional: Makes the input text stand out
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(


                                    hintText: '₹0.00',
                                    hintStyle: const TextStyle(fontSize: 20.0,color: Colors.black26),


                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Enter total income amount',style: TextStyle(fontSize: 12,color: Colors.black26)),
                            SizedBox(height: 5,),




                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Optional rounded corners
                    color: Color.fromRGBO(254, 254, 254,1),
                    border: Border.all(color: Colors.black12, width: 1.0),

                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(width: 10,),

                      Container(
                        padding: const EdgeInsets.all(8.0), // Padding around icon
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 228, 253,1) ,
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: const Icon(
                          Icons.date_range_outlined,
                          color: Color.fromRGBO(108, 74, 240,1),
                          size: 24.0,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text('Date',style: TextStyle(fontSize: 15,color: Colors.black54)),
                          Container(
                            height: 40,width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), // Optional rounded corners
                              color: Color.fromRGBO(254, 254, 254,1),
                              border: Border.all(color: Colors.black12, width: 1.0),

                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.date_range_outlined,color:Color.fromRGBO(108, 74, 240,1) ,size: 20,),
                                Text( DateFormat('dd MMM yyyy').format(_selectedDate),),
                                SizedBox(width: 40,),
                                IconButton(
                                    onPressed: () => _selectDate(context),
                                    icon: Icon(Icons.keyboard_arrow_down,color:Color.fromRGBO(108, 74, 240,1) ,size: 20,))
                              ],
                            ),

                          ),
                          SizedBox(height: 5,),
                          Text('Select the date you received this income',style: TextStyle(fontSize: 12,color: Colors.black26)),
                          SizedBox(height: 5,),

                        ],
                      ),




                      // OutlinedButton.icon(
                      //   onPressed: () => _selectDate(context),
                      //   icon: const Icon(Icons.calendar_month),
                      //   label: Text(
                      //     DateFormat('dd MMM yyyy').format(_selectedDate),
                      //   ),
                      //   style: OutlinedButton.styleFrom(
                      //     side: const BorderSide(
                      //       color: Colors.black54,
                      //       width: 1.0,
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 12,
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      // ),



                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Optional rounded corners
                    color: Color.fromRGBO(254, 254, 254,1),
                    border: Border.all(color: Colors.black12, width: 1.0),

                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(width: 10,),

                      Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0), // Padding around icon
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 228, 253,1) ,// Background color
                              borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            ),
                            child: const Icon(
                              Icons.note_alt_outlined,
                              color: Color.fromRGBO(108, 74, 240,1),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 10,),
                             Text("Note(Optional)",style: TextStyle(fontSize: 15,color: Colors.black54)),
                            SizedBox(height: 10,),
                            SizedBox(height: 130,
                              width: 250,
                              child: TextField(
                                controller: _mynote,
                                 maxLines: null,
                                expands: true,  // Forces the TextField to fill the 140px height
                                textAlignVertical: TextAlignVertical.top,
                                style: const TextStyle(
                                  fontSize:15.0, // Increase this number to make the text bigger
                                  fontWeight: FontWeight.w400, // Optional: Makes the input text stand out
                                ),

                                decoration: InputDecoration(

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(
                                      color: Colors.black54,
                                      width: 1.0,
                                    ),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: Colors.black26, width: 1),



                                  ),

                                  hintText: 'Add a note',
                                  hintStyle: const TextStyle(fontSize: 15.0,color: Colors.black26),


                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Add any detail about this income",style: TextStyle(fontSize: 15,color: Colors.black54)),





                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                Spacer(),
                SizedBox(width: 330,
                  height: 50,
                  child: TextButton(
                    onPressed: ()async{

                      if (_myAmount.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter an amount'))
                        );
                        return;
                      }

                      final amt = double.tryParse(_myAmount.text) ??0.0;
                      final dateStr = _selectedDate.toIso8601String().split('T')[0];

                      await DBHelper.insertIncome(amt,dateStr,_mynote.text);

                      if(mounted){
                        Provider.of<alld>(context, listen: false).refreshallData();

                        Navigator.pop(context,true);

                      }




                    },

                    child: Text('Add Amount',style: TextStyle(fontSize: 20),),style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(113, 82, 251,1), // Sets background color
                    foregroundColor: Colors.white, // Sets text and icon color
                  ),),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
