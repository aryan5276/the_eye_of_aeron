import 'package:flutter/material.dart';
import 'package:pytorch_lite_example/constants.dart';
import 'package:pytorch_lite_example/run_model_by_camera_demo.dart';
import 'package:pytorch_lite_example/run_model_by_image_demo.dart';

class ChooseDemo extends StatefulWidget {
  const ChooseDemo({Key? key}) : super(key: key);

  @override
  State<ChooseDemo> createState() => _ChooseDemoState();
}

class _ChooseDemoState extends State<ChooseDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text(
            'The Eye of Aeron',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height / 2.90,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 1))
                      ], borderRadius: BorderRadius.circular(20)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RunModelByCameraDemo()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.pinkAccent'
                            // gradient: LinearGradient(colors: [
                            //   Color(0xffFF3CAC),
                            //   Color(0xff784BA0),
                            //   Color(0xff2B86C5)
                            // ]
                            //     //colors: [Color(0xFF21D4FD), Color(0xffB721FF)]
                            //     ),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xff4158D0),
                                  Color(0xffC850C0),
                                  //Color(0xffFFCC70)
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Run Model With Camera",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RunModelByCameraDemo()),
                                      );
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  "Use your phone camera to detece UAVs in realtime ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[100],
                                      fontSize: 13))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height / 2.90,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 1))
                      ], borderRadius: BorderRadius.circular(20)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RunModelByImageDemo()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.white
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [Color(0xffC850C0), Colors.pink])),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Run Model On Image",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RunModelByImageDemo()),
                                      );
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Run Model on an image from phone",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 13))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // TextButton(
                //   onPressed: () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const RunModelByCameraDemo()),
                //     )
                //   },
                //   style: TextButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //   ),
                //   child: const Text(
                //     "Run Model with Camera",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // TextButton(
                //   onPressed: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const RunModelByImageDemo()),
                // )
                //   },
                //   style: TextButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //   ),
                //   child: const Text(
                //     "Run Model with Image",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // )
              ],
            ),
          );
        }),
      ),
    );
  }
}
