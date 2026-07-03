import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dataprovider.dart';
import 'demothiredpage.dart';
import 'demoincomepage.dart';
import 'Dbhelper2.dart';
import 'Dbhelper.dart';

// RE-NAMED: Class ka naam badal kar Profile rakh diya hai
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
    // 1. Screen khulte hi bina button click kiye background mein data load hoga
    Future.microtask(() {
      context.read<incomedata>().refreshTotal();
    });
  }



  @override
  Widget build(BuildContext context) {

    final amtdata = context.watch<incomedata>();


    return Scaffold(
      appBar: AppBar(title: Text("Profile Transactions")), // Aap chahein to title badal sakte hain
      body: Column(
        children: [

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
          }, child: Text('Add Income ')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => IncomeDashboard()));
          }, child: Text('View Income')),


          Text('${amtdata.totalIncome}'),



          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: DBHelper.getAllRecords(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No records found"));
                }


                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    var record = snapshot.data![index];

                    // Extract values into local variables safely
                    var incomeValue = record[DBHelper.colIncome];
                    var dateValue = record['record_date'];

                    return ListTile(
                      // .toString() forces the double/int value to safely become a String
                      title: Text(incomeValue != null ? incomeValue.toString() : '0.00'),
                      subtitle: Text(dateValue != null ? dateValue.toString() : 'No Date'),
                    );
                  },
                );
              },
            ),
          ),






        ],
      ),
    );
  }
}

