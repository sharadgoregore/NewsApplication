

class NewsData{
  String id;
  String name;
  NewsData({this.id,this.name});

factory NewsData.fromjson(Map<String,dynamic>json){
  return NewsData(id: json['id'],name: json['name']);
}

}

