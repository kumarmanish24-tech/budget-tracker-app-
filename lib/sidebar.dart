import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appsettingprovider.dart';

class sidebar extends StatefulWidget {
  const sidebar({Key? key}) : super(key: key);

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {

  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {

    final sidedatapro = context.watch<sidebardata>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sidebar Example'),
        backgroundColor: Colors.blue,
      ),
      // 1. Add the Drawer widget to the Scaffold
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Setting",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10,),

                  Container(
                    height: 250,
                    width: 240,
                     // color: Colors.red,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("App Setting",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.dark_mode_outlined),
                            SizedBox(width: 10,),
                            Text(sidedatapro.mode.toString()),
                            SizedBox(width: 75,),
                            Transform.scale(
                              scale: .8,
                              child: Switch(value: sidedatapro.isdark, onChanged: (value){
                                context.read<sidebardata>().Mode(value);
                              }),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.notifications_none),
                            SizedBox(width: 10,),
                            Text(sidedatapro.noti.toString()),
                            SizedBox(width: 45,),
                            Transform.scale(
                              scale: .8,
                              child: Switch(value: sidedatapro.isnotiOn, onChanged: (value){
                                context.read<sidebardata>().Noti(value);
                              }),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.backup_outlined),
                            SizedBox(width: 10,),
                            Text(sidedatapro.backup.toString()),
                            SizedBox(width: 10,),
                            Transform.scale(
                              scale: .8,
                              child: Switch(value: sidedatapro.isbachupOn, onChanged: (value){
                                context.read<sidebardata>().Backu(value);
                              }),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.language),
                            SizedBox(width: 10,),
                            Text("Language"),
                            SizedBox(width: 75,),
                            Row(children: [
                              Text('English',style: TextStyle(color: Colors.black54),),
                              Icon(Icons.arrow_forward_ios_sharp,color: Colors.black54,size: 15,)
                            ],)

                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 180,
                    width: 240,
                     // color: Colors.red,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("Support",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Icon(Icons.help_outline),
                            SizedBox(width: 10,),
                            Text("Help & FAQ"),
                            SizedBox(width: 115,),
                            Row(children: [

                              Icon(Icons.arrow_forward_ios_sharp,color: Colors.black54,size: 15,)
                            ],)

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(Icons.messenger_outline_outlined),
                            SizedBox(width: 10,),
                            Text("Contact Us"),
                            SizedBox(width: 115,),
                            Row(
                              children: [

                                Icon(Icons.arrow_forward_ios_sharp,color: Colors.black54,size: 15,)
                              ],)

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(width: 10,),
                            Text("About App"),
                            SizedBox(width: 115,),
                            Row(children: [

                              Icon(Icons.arrow_forward_ios_sharp,color: Colors.black54,size: 15,)
                            ],)

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Swipe from the left or tap the menu icon!'),
      ),
    );
  }
}
