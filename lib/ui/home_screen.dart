import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 600,
      child: Scaffold(
//backgroundColor: Colors.pink,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CYBERHAWK',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          backgroundColor: Color(0xff3A3A4D),
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: Color(0xff3A3A4D),
          child: ListView(
            children: [
              const SizedBox(
                height: 100.0,
                child: DrawerHeader(
                  margin: EdgeInsets.only(bottom: 4.0),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff3A3A4D), Color(0xff13131D)])),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                title: const Text('item 1'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff3A3A4D), Color(0xff13131D)]),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'We handle  Reportings',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 400.0,
                      child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'REPORT CRIME',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          color: Colors.amberAccent),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Recommended',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 150.0,
                          width: 110.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff3A3A4D), Color(0xff13131D)]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/report.jpg'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'report',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          height: 150.0,
                          width: 110.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff3A3A4D), Color(0xff13131D)]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/smartphone.jpg'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Smartphone',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          height: 150.0,
                          width: 110.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff3A3A4D), Color(0xff13131D)]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/data-analytics.jpg'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'My Analytics',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Recent Reports',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            //height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.9,
                            color: Colors.transparent,
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/th.jpg')),
                                SizedBox(
                                  height: 10.0,
                                  width: 20.0,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.green,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                'online Reporting',
                                                style:
                                                    TextStyle(fontSize: 10.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Instagram",
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          )
                                        ],
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                      ),
                                      Text(
                                        "Lorem Ipsum is simply dummy text of the prin…",
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
