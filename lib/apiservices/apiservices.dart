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
        "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
//var encode = json.encode(response.body);
      var jsonmap = json.decode(jsonstring);
     // print(jsonmap);
     // //print(newsmodel);
     // print(response.statusCode);
      newsmodel = welcomeFromJson(jsonstring);
      return newsmodel;
    }
  }
  
}
////////// Sports news ////////////
class Apisports {
  Future<Welcome> getnews() async {
    var client = https.Client();
    // ignore: avoid_init_to_null
    var newsmodel;
    //print('hshhhshj');

    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=5cd543951af649eb849069dd13ab3f7c"));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
//var encode = json.encode(response.body);
      var jsonmap = json.decode(jsonstring);
     // print(jsonmap);
     // //print(newsmodel);
      //print(response.statusCode);
      newsmodel = welcomeFromJson(jsonstring);
      return newsmodel;
    }
  }
  
}
////////////// Entertainment///////////////
class Apientertainment {
  Future<Welcome> getnews() async {
    var client = https.Client();
    // ignore: avoid_init_to_null
    var newsmodel;
    //print('hshhhshj');

    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=5cd543951af649eb849069dd13ab3f7c"));
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
  
}

/////////////////// Tech /////////////////////

class Apitech {
  Future<Welcome> getnews() async {
    var client = https.Client();
    // ignore: avoid_init_to_null
    var newsmodel;
    //print('hshhhshj');

    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=5cd543951af649eb849069dd13ab3f7c"));
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
  
}