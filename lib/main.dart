// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bonsoir/bonsoir.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        primaryColor: Colors.white,
      ),
      home: const Bonsoirr(),
    ));

class Bonsoirr extends StatefulWidget {
  const Bonsoirr({Key? key}) : super(key: key);
  @override
  _BonsoirrState createState() => _BonsoirrState();
}

class Devices {
  String name;
  String deviceName;
  String deviceValue;
  int number = 200;
  Devices(this.name, this.deviceName, this.deviceValue, this.number);
  factory Devices.fromJson(dynamic json) {
    return Devices(
      json["name"] as String,
      json["deviceName"] as String,
      json["deviceValue"] as String,
      json["number"] as int,
    );
  }
}

class _BonsoirrState extends State<Bonsoirr> {
  List phones = [
    Devices(
      "Tecno F1",
      "Samsung f1",
      "Connected Today",
      1,
    ),
    Devices(
      "Nokia F1",
      "Samsung s1",
      "Connected 10/11/22",
      2,
    ),
    Devices(
      "Iphone 7",
      "Iphone 11promax",
      "Connected 20/11/22",
      2,
    ),
    Devices(
      "Motorola",
      "Iphone 12promax",
      "Connected 20/11/22",
      2,
    ),
    Devices(
      "Samsung s1",
      "Iphone 13promax",
      "Connected 20/11/22",
      2,
    ),
  ];

  TextEditingController usernameC = TextEditingController();
  TextEditingController passnameC = TextEditingController();
  var response = "";
  bool error = true;
  String errorCheck = "";
  String _notConnected = "";
  bool isConnected = true;
  bool isGoodtogo = false;
  int number = 70;
  String name = "Device";
  String url = "url";
  bool isAvailable = true;
  double digits = 10.3;
  final double _result = 11.5;
  double value = 22.5;
  final bool _value = false;
  GlobalKey formkey = GlobalKey();
  late AnimationController _animationController;
  _showMessage(String message, Duration duration) {}
  bool _obscureText = true;
  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future getUserData() async {
    // ignore: unused_local_variable
    var result = "";
  }

  void checkUser() async {
    String _response = (await SharedPreferences.getInstance()) as String;
    SharedPreferences sharedPreferences = _response as SharedPreferences;
    if (sharedPreferences.getString("Shared Result") != null) {
      usernameC.text = sharedPreferences.getString("Shared Result")!;
      passnameC.text = sharedPreferences.getString("Shared Pass")!;
      setState(() {
        isAvailable = true;
        isGoodtogo = true;
        isConnected = true;
      });
    }
  }

  String deviceamount = "";
  bool isPaired = false;
  bool isBroadcasting = false;
  bool isNotBroadcasting = false;
  String ErrorConnecting = "";
  bool isSelected = true;
  // void initState() {
  //   super.initState();
  //   phones.add("Iphone 11 pro max");
  //   phones.add("Samsung Edge");
  //   phones.add("Tecno w5");
  //   phones.add("Iphone 7plus");
  // }
  // ignore: prefer_const_constructors, unused_field
  BonsoirService myservice = BonsoirService(
    name: "Welcome to my service",
    type: "_wonderful-service._tcp",
    port: 4530,
  );

  //Methods for bradcast:
  Future BroadcastService() async {
    var _broadcast = BonsoirBroadcast(service: myservice);
    BonsoirBroadcast broadcast = _broadcast;
    await broadcast.ready;
    print("This shows $broadcast.ready");
  }

  Future _BroadcastService() async {
    var _broadcast = BonsoirBroadcast(service: myservice);
    BonsoirBroadcast broadcast = _broadcast;
    await broadcast.start();
    print("This shows $broadcast.ready");
    print("This show $broadcast");
  }

  Future StopBroadcastService() async {
    var _broadcast = BonsoirBroadcast(service: myservice);
    BonsoirBroadcast broadcast = _broadcast;
    await broadcast.stop();
    print("This is $BroadcastService");
    print("Welcome to bonsoir package");
    print("This shows $broadcast.ready");
    print("This show $broadcast");
  }

  //Methods for discovery:
  Future ReadyDiscoverBroadcast() async {
    print("we are ready to discover now");
    String _result = "_wonderful-service._tcp";
    var _discovery = BonsoirDiscovery(type: _result);
    BonsoirDiscovery result = _discovery;
    print("This is the $result");
    await result.ready;
  }

  Future StartDiscoverBroadcast() async {
    print("Its time to start discovery");
    String _result = "_wonderful-service._tcp";
    var _discovery = BonsoirDiscovery(type: _result);
    BonsoirDiscovery result = _discovery;
    print("This is the $result of the discovery");
    await result.start();
  }

  Future ListenDiscovery(event) async {
    var _event = BonsoirDiscoveryEventType;
    if (event._result == BonsoirBroadcastEventType.BROADCAST_STARTED) {
      print("Device Found : ${event.service.toJson()}");
    } else if (event._result == BonsoirBroadcastEventType.BROADCAST_STOPPED) {
      print("Device Lost : ${event.service.toJson()}");
    } else if (event._result == BonsoirBroadcastEventType.UNKNOWN) {
      print("Unknown error during ${event.service.toJson()}");
    } else {
      print("Error occurred during ${event.service.toJson()}");
      print(BonsoirBroadcastAction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.white,
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Text(
                  "BONSOIR",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // isConnected
                    //     ? Text("Found $deviceamount devices")
                    //:
                    const SizedBox(
                      width: 0,
                    ),
                    Column(
                      children: [
                        Text(
                          "BROADCAST",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("   "),
                        ToggleSwitch(
                          minWidth: 50.0,
                          cornerRadius: 18.0,
                          // ignore: prefer_const_literals_to_create_immutables
                          activeBgColors: [
                            const [Colors.black45],
                            const [Colors.black45]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.black12,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          labels: const ['Off', 'On'],
                          radiusStyle: true,
                          onToggle: (value) {
                            print('switched to: $value');
                            _BroadcastService();
                            if (value != null) {
                              setState(() {
                                isConnected = true;
                                isAvailable = true;
                                isBroadcasting = true;
                              });
                            } else if (value == false) {
                              setState(() {
                                error = true;
                                errorCheck = "There was an error connecting";
                              });
                            } else if (value == null) {
                              setState(() {
                                isNotBroadcasting = true;
                              });
                            } else {
                              errorCheck;
                            }
                          },
                          //hangeOnTap: true,
                        ),
                      ],
                    ),

                    const SizedBox(
                      width: 150,
                    ),
                    Column(
                      children: [
                        Text(
                          "DISCOVER",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("   "),
                        ToggleSwitch(
                          minWidth: 50.0,
                          cornerRadius: 18.0,
                          // ignore: prefer_const_literals_to_create_immutables
                          activeBgColors: [
                            const [Colors.black45],
                            const [Colors.black45]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.black12,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          labels: const ['Off', 'On'],
                          radiusStyle: true,
                          onToggle: (value) {
                            print('switched to: $value');
                            StartDiscoverBroadcast();

                            if (value != null) {
                              setState(() {
                                isConnected = true;
                                isAvailable = true;
                                isBroadcasting = true;
                              });
                            } else if (value == false) {
                              setState(() {
                                error = true;
                                errorCheck = "There was an error connecting";
                              });
                            } else if (value == null) {
                              setState(() {
                                isNotBroadcasting = true;
                              });
                            } else {
                              errorCheck;
                            }
                          },
                          changeOnTap: true,
                        ),
                      ],
                    ),
                  ],
                ),
                isConnected
                    ? const Text(
                        "Device found",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      )
                    : Text(
                        errorCheck,
                        style: const TextStyle(color: Colors.black),
                      ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: phones.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              key: Key(phones[index].name),
              child: Card(
                child: ListTile(
                  title: Text(
                    phones[index].name,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(phones[index].deviceValue),
                  //leading: Text(phones[index].deviceValue),
                ),
              ),
            );
          },
        )
        // ToggleButtons(
        //   children: const [],
        //   onPressed: (int index) {
        //     setState(() {});
        //   },
        //   isSelected: const [],
        //   color: Colors.black,
        // ),
        // const SizedBox(
        //   height: 250,

        // Container(
        //   width: 320,
        //   height: 42,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5),
        //     // ignore: prefer_const_constructors
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       // 10% of the width, so there are ten blinds.
        //       // ignore: prefer_const_literals_to_create_immutables
        //       colors: <Color>[
        //         const Color(0xff3e6952),
        //         const Color(0xff192920),
        //       ], // red to yellow
        //       tileMode:
        //           TileMode.repeated, // repeats the gradient over the canvas
        //     ),
        //   ),
        //   child: InkWell(
        //     onTap: () {},
        //     child: const Center(
        //       child: Text(
        //         "CLICK TO ACCESS AVAILABLE DEVICES",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           letterSpacing: 0.0,
        //           fontSize: 12,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        //isAvailable ? Container() : Container(),
        // ],
        //),
        //),
        );
  }
}
// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   theme: ThemeData(
//     brightness: Brightness.light,
//     // ignore: deprecated_member_use
//     accentColor: Colors.amber,
//     primaryColor: Colors.white,
//   ),
//   home: const Bonsoir(),
// ));

// class Bonsoir extends StatefulWidget {
//   const Bonsoir({Key? key}) : super(key: key);
//   @override
//   _BonsoirState createState() => _BonsoirState();
// }
// class _BonsoirState extends State<Bonsoir> {
//   bool isConnected = true;
//   bool isGoodtogo = false;
//   int number = 70;
//   String name = "Device";
//   String url = "url";
//   bool isAvailable = true;
//   double digits = "10.3" as double;
//   double width = "" as double;
//   double height = "" as double;
//   // ignore: unused_element
//   _showMessage(String message, Duration duration) {}
//   bool _obscureText = true;
//   void toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "BONSOIR",
//           style: TextStyle(
//             color: Colors.grey[900],
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 250,
//             ),
//             Center(
//               child: Container(
//                 width: 320,
//                 height: 42,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   // ignore: prefer_const_constructors
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     // 10% of the width, so there are ten blinds.
//                     // ignore: prefer_const_literals_to_create_immutables
//                     colors: <Color>[
//                       const Color(0xff3e6952),
//                       const Color(0xff192920),
//                     ], // red to yellow
//                     tileMode: TileMode
//                         .repeated, // repeats the gradient over the canvas
//                   ),
//                 ),
//                 child: InkWell(
//                   onTap: () {},
//                   // ignore: prefer_const_constructors
//                   child: Center(
//                     child: const Text(
//                       "BROADCAST",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.0,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: 320,
//               height: 42,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 // ignore: prefer_const_constructors
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   // 10% of the width, so there are ten blinds.
//                   // ignore: prefer_const_literals_to_create_immutables
//                   colors: <Color>[
//                     const Color(0xff3e6952),
//                     const Color(0xff192920),
//                   ], // red to yellow
//                   tileMode:
//                   TileMode.repeated, // repeats the gradient over the canvas
//                 ),
//               ),
//               child: InkWell(
//                 onTap: () {},
//                 child: const Center(
//                   child: Text(
//                     "CONNECT NEARBY DEVICE",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.0,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             isAvailable ? Container() : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Package extends StatefulWidget {
//   const Package({Key? key}) : super(key: key);
//   @override
//   _PackageState createState() => _PackageState();
// }
// class _PackageState extends State<Package> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//
//}
// ignore: camel_case_types
// class _bonsoir extends StatefulWidget {
//   const _bonsoir({Key? key}) : super(key: key);
//   @override
//   __bonsoirState createState() => __bonsoirState();
// }
// // ignore: camel_case_types
// class __bonsoirState extends State<_bonsoir> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }



// Future _BroadcastService() async {
//     var _broadcast = BonsoirBroadcast(service: myservice);
//     BonsoirBroadcast broadcast = _broadcast;
//     await broadcast.start().then((user){
//       if(user = ){}
//     }).catchError((error){
//       print("There was an error connecting");
//     });
//     print("This shows $broadcast.ready");
//     print("This show $broadcast");
//   }
