import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'buy_now.dart';

class DetailChoose extends StatefulWidget {
  DetailChoose({super.key, required this.idx});
  String idx;

  @override
  _DetailChooseState createState() => _DetailChooseState();
}

class _DetailChooseState extends State<DetailChoose> {
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
          "http://192.168.100.100:8087/flutter_shopping/detail_choose.php?auth=${authkey}&idx=${widget.idx}"));

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
                  "e-Commerce Shopping\n(Rest API, PHP, MYSQL)",
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 16),
                      child: Text(
                        "Discount 50%\nPlease choose",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 15),
                      ),
                    ),
                    //.........................................................
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 16),
                      child: Text(
                        "Shopping List",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 15),
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
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext) =>
                                          BuyNow(idx: _get[index]['idx'])));
                            },
                            child: Text("Buy Now")),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Go Back")),
                      ],
                    ),
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
