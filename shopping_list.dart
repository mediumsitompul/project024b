import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail_choose.dart';
import 'main.dart';
import 'linkto_web.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List _get = [];
  var authkey = 'kjgdkhdfldfguttedfgr';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.100.100:8087/flutter_shopping/shopping_list.php?auth=${authkey}"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['datajs'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 121, 33, 243),
            title: Builder(builder: (context) {
              return const Center(
                child: Text(
                  "Shopping List)",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => MyApp())),
                        child: const Text(
                          "SHOP AGAIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    //.........................................................
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) =>
                                    LinktoWeb0())), //++++++++++++++++++++++++++++
                        child: const Text(
                          "CHECK OUT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                GridList(get: _get),
              ],
            ),
          )),
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({super.key, required List get}) : _get = get;
  final List _get;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _get.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image(
                  image: NetworkImage(_get[index]['pic_'] ??
                      "http://192.168.100.100:8087/flutter_shopping/assets/images/medium.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      _get[index]['idx'] ?? "No Title",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    //....................................
                    Text(
                      _get[index]['item'] ?? "No Title",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _get[index]['price_'] ?? "No Title",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //....................................
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
