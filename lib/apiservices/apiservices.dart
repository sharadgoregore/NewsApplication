import 'dart:convert';

import 'package:http/http.dart' as https;

import 'package:newsapp/models/newsdata.dart';

class Apiservices {
  Future<Welcome> getnews() async {
    var client = https.Client();
    // ignore: avoid_init_to_null
    var newsmodel;
    //print('hshhhshj');

    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5cd543951af649eb849069dd13ab3f7c"));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
//var encode = json.encode(response.body);
      var jsonmap = json.decode(jsonstring);
      //print(jsonmap);
     // //print(newsmodel);
      //print(response.statusCode);
      newsmodel = welcomeFromJson(jsonstring);
      return newsmodel;
    }
  }
  // final endpoint =
  //     "https://newsapi.org/v2/everything?q=tesla&from=2021-05-06&sortBy=publishedAt&apiKey=5cd543951af649eb849069dd13ab3f7c";

  // Future<List<Newsdetail>> getnewsdetail() async {
  //   http.Response response = await http.get(Uri.parse(endpoint));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(response.body);

  //     List<dynamic> body = json['articles'];

  //     List<Newsdetail> articles =
  //         body.map((dynamic item) => Newsdetail.fromJson(item)).toList();

  //     return articles;
  //   } else {
  //     throw (' Error occured');
  //   }
  // }
}
