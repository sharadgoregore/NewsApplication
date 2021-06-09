import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/Customlistile.dart';
import 'package:newsapp/apiservices/Apiservices2.dart';
import 'package:newsapp/apiservices/Apiservices3.dart';
import 'package:newsapp/apiservices/apiservices.dart';

import 'package:newsapp/models/newsdata.dart';

import 'package:http/http.dart' as https;

class NewsHome extends StatefulWidget {
  // const NewsHome({ Key? key }) : super(key: key);

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome>
    with SingleTickerProviderStateMixin {
  final key = GlobalKey<FormState>();

  // Apiservices services = Apiservices
  // ();
  Future<Welcome> _welcome;
  Future<Welcome> _welcome2;
  Future<Welcome> _welcome3;
  Future<Welcome> _welcome4;
  Future<Welcome> _welcome5;
  Future<Welcome> _welcome6;

  var refreshkey = GlobalKey<RefreshIndicatorState>();
  String queryNews;
  Future todos;
  @override
  void initState() {
    _welcome = Apiservices().getnews();
    _welcome2 = Apiservices2().getnews();
    _welcome4 = Apisports().getnews();
    _welcome5 = Apientertainment().getnews();
    _welcome6 = Apitech().getnews();
    super.initState();
  }

  newsearch(String q) async {
    setState(() {
      _welcome3 = Apiservices3().getNewsSearch(q);
      print('call---->$_welcome3');
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(children: [
              // Container(
              //   height: 100,
              //   width: 100,

              //   decoration: BoxDecoration(

              //     borderRadius: BorderRadius.circular(30),
              //     image: DecorationImage(image: NetworkImage("https://cdn01.prnews.io/content/sites/logos/ba294061474dd43040488b001daae2c2.jpeg?1615468591"))
              //   ),
              // ),
              Text(
                "NationNews",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 30),
                child: Container(
                  width: 230,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: key,
                    child: TextFormField(
                      onChanged: (value) {
                        queryNews = value;
                      },
                      decoration: InputDecoration(
                        icon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            print('callagain---->$queryNews');
                            if (queryNews == "") {
                              return _welcome;
                            }

                            newsearch(queryNews);
                          },
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            bottom: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Todays News",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Top Headlines",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Sports",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Entertainment",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Tech",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                    ),
                  )
                ]),
          ),
          body: TabBarView(
            children: [
              FutureBuilder<Welcome>(
                  future: _welcome3 != null ? _welcome3 : _welcome,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Article> article = snapshot.data.articles;

                      // print(article);
                      return ListView.builder(
                          itemCount: snapshot.data.articles.length,
                          itemBuilder: (context, index) =>
                              customListTile(article[index], context));
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
              RefreshIndicator(
                key: refreshkey,
                onRefresh: fetchFruit,
                child: FutureBuilder<Welcome>(
                    future: _welcome2,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Article> article = snapshot.data.articles;
                        // print(article);
                        return ListView.builder(
                            itemCount: snapshot.data.articles.length,
                            itemBuilder: (context, index) =>
                                customListTile(article[index], context));
                      } else
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                    }),
              ),
              FutureBuilder<Welcome>(
                  future: _welcome4,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Article> article = snapshot.data.articles;

                      // print(article);
                      return ListView.builder(
                          itemCount: snapshot.data.articles.length,
                          itemBuilder: (context, index) =>
                              customListTile(article[index], context));
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
              FutureBuilder<Welcome>(
                  future: _welcome5,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Article> article = snapshot.data.articles;

                      // print(article);
                      return ListView.builder(
                          itemCount: snapshot.data.articles.length,
                          itemBuilder: (context, index) =>
                              customListTile(article[index], context));
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
              FutureBuilder<Welcome>(
                  future: _welcome6,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Article> article = snapshot.data.articles;

                      // print(article);
                      return ListView.builder(
                          itemCount: snapshot.data.articles.length,
                          itemBuilder: (context, index) =>
                              customListTile(article[index], context));
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            ],
          ),
        ));
  }


  Future fetchFruit() async {
  final response = await https.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=5cd543951af649eb849069dd13ab3f7c"));
  if (response.statusCode == 200) {
    return decodeFruit(response.body);

  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

Future<Welcome> decodeFruit(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed<Welcome>((json) => Welcome.fromJson(json));
  
}
}

//   Future<void> refreshList() async {
//     final response = await https.get(Uri.parse(
//         "https://newsapi.org/v2/top-headlines?country=us&apiKey=5cd543951af649eb849069dd13ab3f7c"));
//     if (response.statusCode == 200) {
//       return (response.body);
//     } else {
//       throw Exception('Unable to fetch data from the REST API');
//     }
//   }
// }
