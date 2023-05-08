import 'package:flutter/material.dart';
import 'package:giphi_explorer/repositories/remote.dart';
import 'package:giphi_explorer/repositories/share.dart';
import 'gift_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getGiphy get = getGiphy();
  ShareLink share = ShareLink();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Image.network(
                'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif')),
        body: Center(
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search GIFs',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (value) {
                setState(() {
                  get.search = value;
                  get.offset = 0;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5.0,
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Container(
                            width: 200.0,
                            height: 200.0,
                            alignment: Alignment.center,
                            child: const Text(
                              'Error loading GIFs :(',
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                              textAlign: TextAlign.center,
                            ),
                          );
                        } else {
                          return GridView.builder(
                              padding: const EdgeInsets.all(10.0),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                              itemCount: count(snapshot.data!["data"]),
                              itemBuilder: (context, index) {
                                if (get.search == null || index < snapshot.data!["data"].length) {
                                  return GestureDetector(
                                    child: Image.network(
                                      snapshot.data!["data"][index]["images"]["fixed_height"]["url"],
                                      height: 300.0,
                                      fit: BoxFit.cover,
                                    ),
                                    onLongPress: () {
                                      share.share(
                                          snapshot.data!["data"][index]["images"]["fixed_height"]["url"].toString());
                                    },
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GiftPage(getGifs: snapshot.data!["data"][index])));
                                    },
                                  );
                                } else {
                                  return Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(80.0))),
                                      child: GestureDetector(
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
                                          Icon(Icons.add, color: Colors.white, size: 70.0),
                                          Text(
                                            'Load more...',
                                            style: TextStyle(color: Colors.white, fontSize: 22.0),
                                          ),
                                        ]),
                                        onTap: () {
                                          setState(() {
                                            get.offset += 19;
                                          });
                                        },
                                      ));
                                }
                              });
                        }
                    }
                  },
                  future: get.getGifs()),
            ),
          ]),
        ));
  }

  int count(List data) {
    if (get.search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }
}
