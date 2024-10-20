import 'package:first_flutter/page/product_page.dart';
import 'package:first_flutter/widgets/MyAnimatedWidget.dart';
import 'package:flutter/material.dart';
import 'model/product_model.dart';
import 'page/products_list.dart';

void main() => runApp(const MyApp());

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product state demo home page'),
    );
  }
}*/
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 10), vsync: this
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue,),
        home: MyHomePage(title: 'Product layout demo home page', animation: animation,)
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title, required this.animation});
  final String title;
  final items = Product.getProducts();
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Navigation")),
      body: ListView.builder(
        // ignore: avoid_print
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: MyAnimatedWidget(
              animation: animation,
              child: ProductBox(items: items[index]),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(items: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
