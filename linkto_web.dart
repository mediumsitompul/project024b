import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class LinktoWeb0 extends StatelessWidget {
  const LinktoWeb0({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("PAYMENT METHOD\nSUPPORT BY")),
        ),
        body: LinktoWeb(),
      ),
    );
  }
}

class LinktoWeb extends StatefulWidget {
  const LinktoWeb({super.key});

  @override
  State<LinktoWeb> createState() => _LinktoWebState();
}

class _LinktoWebState extends State<LinktoWeb> {
  final Uri _url =
      Uri.parse("http://192.168.100.100:8087/flutter_shopping/index.php");
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(
            image: NetworkImage(
                "http://192.168.100.100:8087/flutter_shopping/assets/images/payment.png"),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _launchUrl();
              },
              child: Text("PLEASE TAP HERE\nFOR TOTAL PAYMENT"))
        ],
      ),
    );
  }
}
