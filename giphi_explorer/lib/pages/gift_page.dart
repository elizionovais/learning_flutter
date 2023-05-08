import 'package:flutter/material.dart';
import 'package:giphi_explorer/repositories/share.dart';

class GiftPage extends StatelessWidget {
  GiftPage({super.key, required this.getGifs});
  ShareLink shareLink = ShareLink();
  final Map getGifs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getGifs["title"]),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              shareLink.share(getGifs["images"]["fixed_height"]["url"].toString());
            },
          ),
        ],
      ),
      body: Center(
        child: Image.network(getGifs["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
