import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ex27/custom models/cuntomcon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userproinput extends StatefulWidget {
  const userproinput({Key? key}) : super(key: key);

  @override
  State<userproinput> createState() => _userproinputState();
}

class _userproinputState extends State<userproinput> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _additional = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _additional.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              height: 240,
              width: double.infinity,
              color: Color.fromRGBO(100, 90, 237, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20, width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),
                      Text(
                        "Complete your",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Please enter your details",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "to get started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Lottie.asset(
                        "assets/lotties/Study.json",
                        width: 190,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 350,
                    // color: Colors.black12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 18),
                            Icon(
                              Icons.perm_identity_rounded,
                              color: Color.fromRGBO(100, 90, 237, 0.8),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Personal Information",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 340,
                          child: TextField(
                            controller: _name,
                            decoration: InputDecoration(
                              hintText: 'Full Name', // The placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(100, 90, 237, 0.8),
                                  width: 1.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.perm_identity_rounded,
                                color: Color.fromRGBO(100, 90, 237, 0.8),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 340,
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              hintText: 'Email Address', // The placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(100, 90, 237, 0.8),
                                  width: 1.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color.fromRGBO(100, 90, 237, 0.8),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 340,
                          child: TextField(
                            controller: _phone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Phone Number', // The placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(100, 90, 237, 0.8),
                                  width: 1.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color.fromRGBO(100, 90, 237, 0.8),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 350,
                    // color: Colors.black12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 18),
                            Icon(
                              Icons.info_outline,
                              color: Color.fromRGBO(100, 90, 237, 0.8),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Additional Information",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 340,
                          height: 100,
                          child: TextField(
                            controller: _additional,
                            decoration: InputDecoration(
                              isDense: true,
                              // controls the exact height via padding
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 100.0,
                                horizontal: 10.0,
                              ),

                              hintText:
                                  'Anything else you want to add(optional)', // The placeholder text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(100, 90, 237, 0.8),
                                  width: 1.0,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextButton(
                      onPressed: () async{
                        print("Button clicked");

                        if (_name.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please Enter Details'))
                          );
                          return;
                        }

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString("name", _name.text.trim());


                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                        
                        
                        
                      },
                      child: Text(
                        "Save & Continue   →",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(100, 90, 237, 0.8),
                        foregroundColor: Colors.white,
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
