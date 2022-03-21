import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Мои фото', 'Галерея'];

  Map<String, List<String>> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 0,
          title: const Text('Homework example'),
          bottom: TabBar(
            labelPadding: const EdgeInsets.symmetric(vertical: 10),
            tabs: [
              ...nav
                  .map(
                    (e) => Text(e, style: const TextStyle(fontSize: 15)),
                  )
                  .toList()
            ],
          ),
        ),
        body: Column(
          children: [
            const Text('data'),
            Expanded(
              child: TabBarView(
                children: [
                  for (var name in nav)
                    ListView(
                      key: PageStorageKey(name),
                      children: <Widget>[
                        for (var images in data[name]!)
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: Image.network(images),
                              ),
                            ],
                          )
                      ],
                    ),
                ],
              ),
            ),
            const Text('data')
          ],
        ),
      ),
    );
  }
}
