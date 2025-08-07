import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // สร้างลิสต์ข้อมูล
  final List<String> items = List<String>.generate(50, (i) => 'items ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ปฏิบัติการบทที่ 6'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          // ไล่เฉดสีด้วยเฉดของ Colors.teal
          final List<int> shades = [900, 800, 700, 600, 500, 400, 300, 200, 100, 50];
          int shadeIndex = (index ~/ 1).clamp(0, shades.length - 2); // เปลี่ยนทุก 3 รายการ
          int shade = shades[shadeIndex];

          return Container(
            color: Colors.teal[shade],
            child: ListTile(
              leading: const Icon(Icons.label_important_outline, color: Colors.white),
              title: Text(
                items[index],
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'item details $index',
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
              onTap: () {
                print('แตะที่: ${items[index]} (index $index)');
              },
            ),
          );
        },
      ),
    );
  }
}
