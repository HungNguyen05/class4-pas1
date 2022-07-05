// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController n1Control = TextEditingController();
  TextEditingController n2Control = TextEditingController();
  var n1, n2;
  var result = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/1.jpg'))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: n1Control,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Nhập số thứ nhất",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black45.withOpacity(0.5))),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: n2Control,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Nhập số thứ hai",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black45.withOpacity(0.5))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kết Quả Là :$result",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bool err = false;
                      try {
                        setState(() {
                          n1 = double.tryParse(n1Control.text);
                          n2 = double.tryParse(n2Control.text);
                          if (n1Control.text.isEmpty ||
                              n2Control.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Xin nhập 2 số ")));
                          } else
                            result = n1 + n2;
                        });
                      } catch (e, s) {
                        err = true;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Xin mời nhập đúng dữ liệu")));
                      }
                    },
                    child: Icon(Icons.add),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool err = false;
                        try {
                          setState(() {
                            n1 = double.tryParse(n1Control.text);
                            n2 = double.tryParse(n2Control.text);
                            if (n1Control.text.isEmpty ||
                                n2Control.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Xin nhập 2 số ")));
                            } else
                              result = n1 - n2;
                          });
                        } catch (e, s) {
                          err = true;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Xin mời nhập đúng dữ liệu")));
                        }
                      },
                      child: Text("-"),
                      style: ElevatedButton.styleFrom(primary: Colors.red)),
                  ElevatedButton(
                      onPressed: () {
                        bool err = false;
                        try {
                          setState(() {
                            n1 = double.tryParse(n1Control.text);
                            n2 = double.tryParse(n2Control.text);
                            if (n1Control.text.isEmpty ||
                                n2Control.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Xin nhập 2 số ")));
                            } else
                              result = n1 * n2;
                          });
                        } catch (e, s) {
                          err = true;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Xin mời nhập đúng dữ liệu")));
                        }
                      },
                      child: Text(
                        "X",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.green)),
                  ElevatedButton(
                      onPressed: () {
                        bool err = false;
                        try {
                          setState(() {
                            n1 = double.tryParse(n1Control.text);
                            n2 = double.tryParse(n2Control.text);
                            if (n1Control.text.isEmpty ||
                                n2Control.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Xin nhập 2 số ")));
                            } else
                              result = n1 / n2;
                          });
                        } catch (e, s) {
                          err = true;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Xin mời nhập đúng dữ liệu")));
                        }
                      },
                      child: Text(":"),
                      style: ElevatedButton.styleFrom(primary: Colors.orange))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
