import 'package:flutter/material.dart';
import 'package:gdsc_lesson_1/screens/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var data = [
      {
        "imageUrl":
            "https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/download-23.jpg",
        "location": "Ankara/Turkey",
        "price": 400,
      },
      {
        "imageUrl":
            "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwaG91c2V8ZW58MHx8MHx8&w=1000&q=80",
        "location": "Mersin/Turkey",
        "price": 550,
      },
      {
        "imageUrl":
            "https://cdn.decoist.com/wp-content/uploads/2021/06/Modular-black-house-with-balcony-49706.jpg",
        "location": "Tekirdağ/Turkey",
        "price": 800,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Real Estate"),
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return DetailScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                imageUrl: data[index]["imageUrl"].toString(),
                price: "${data[index]['price']}",
                location: "${data[index]['location']}",
              ),
            ),
          );
        }),
        itemCount: data.length,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                "Real Estate",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.amber,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.green,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Exit",
                  style: TextStyle(fontSize: 24),
                ),
                Icon(
                  Icons.exit_to_app,
                  size: 36,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String location;
  const Card(
      {Key? key,
      required this.imageUrl,
      required this.price,
      required this.location})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.fill)),
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 220),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$price\$",
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              Text(location,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
