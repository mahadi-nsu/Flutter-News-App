import 'package:flutter/material.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loadingInProgress;
  var newsList;

  void getAllnews() async {
    News news = new News();
    await news.getNews();

    setState(() {
      loadingInProgress = false;
      newsList = news.news;
    });
  }

  @override
  void initState() {
    loadingInProgress = true;
    super.initState();
    getAllnews();
  }

  Widget build(BuildContext context) {
    print(newsList);
    print("Mahadi");
    print(newsList.length);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: loadingInProgress
              ? Center(child: Text("loading..."))
              : Column(children: <Widget>[
                  Row(children: <Widget>[
                    Text(
                      "Top Headlines",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Divider(),
                  Expanded(
                      child: ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(newsList[index].title),
                            );
                          }))
                ]),
        ),
      ),
    );
  }
}
