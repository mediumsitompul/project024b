import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui_marketplace/shopping_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BuyNow extends StatefulWidget {
  BuyNow({super.key, required this.idx});
  String idx;

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  Future _buy() async {
    final url =
        Uri.parse("http://192.168.100.100:8087/flutter_shopping/buy_now.php");
    final response = await http.post(url, body: {"idx": widget.idx});
    final result1 = jsonDecode(response.body);

    if (result1.isNotEmpty) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext) => ShoppingList()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _buy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
