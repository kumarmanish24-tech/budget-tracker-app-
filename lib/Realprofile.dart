import 'package:flutter/material.dart';
import 'custom models/cuntomcon.dart';
import 'package:lottie/lottie.dart';

class realprofile extends StatefulWidget {
  const realprofile({Key? key}) : super(key: key);

  @override
  State<realprofile> createState() => _realprofileState();
}

class _realprofileState extends State<realprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              height: 320,
              width: double.infinity,
              color: Color.fromRGBO(100, 90, 237, 0.8),
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 200,
                        width: 250,
                        child: Lottie.asset("assets/lotties/Profile Avatar of Young Boy.json")),
                    Text("Riya Sharma",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),)
                  ],
                ),
              )
            ),
          ),
          Container(
            height: 350,
            width: 350,
             // color: Colors.red,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personal information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                    SizedBox(height: 10,),

                    Container(
                      height: 280,
                      width: 330,

                      decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.0,
                        ),
                      ),
                      child: Column(
                        children: [

                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(

                                color: Colors.blue.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.email, color: Colors.blue),
                            ),
                            // Read Income Amount
                            title: Text(
                              'Email',
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                            ),
                            // Read Notes and Date
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                   'riyasharma@gaiml.com',
                                  style: const TextStyle(color: Colors.black54),
                                ),


                              ],
                            ),
                            // Delete Button (Optional)

                          ),
                          Divider(),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(

                                color: Colors.blue.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.phone, color: Colors.blue),
                            ),
                            // Read Income Amount
                            title: Text(
                              'Phone',
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                            ),
                            // Read Notes and Date
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  '+91225689242',
                                  style: const TextStyle(color: Colors.black54),
                                ),


                              ],
                            ),
                            // Delete Button (Optional)

                          ),
                          Divider(),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(

                                color: Colors.blue.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.info, color: Colors.blue),
                            ),
                            // Read Income Amount
                            title: Text(
                              'Info',
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                            ),
                            // Read Notes and Date
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  'No info added yet',
                                  style: const TextStyle(color: Colors.black54),
                                ),


                              ],
                            ),
                            // Delete Button (Optional)

                          ),




                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
