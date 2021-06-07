import 'dart:convert';

import 'package:http/http.dart' as https;

import 'package:newsapp/models/newsdata.dart';

class Apiservices2 {
  Future<Welcome> getnews() async {
    var client = https.Client();
    // ignore: avoid_init_to_null
    var newsmodel;
   

    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=5cd543951af649eb849069dd13ab3f7c"));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
//var encode = json.encode(response.body);
      var jsonmap = json.decode(jsonstring);
      //print(jsonmap);
      //print(newsmodel);
     // print(response.statusCode);
      newsmodel = welcomeFromJson(jsonstring);
      return newsmodel;
    }
  }

}
  


