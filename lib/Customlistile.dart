import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Articledetail.dart';
import 'package:newsapp/models/newsdata.dart';

Widget customListTile(
  Article art,
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: art,
                  )));
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(8.0),
     
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                height: 200.0,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: art.urlToImage ?? '',
                  placeholder: (context, url) =>
                      Image.network(art.urlToImage ?? ""),
                  errorWidget: (context, url, error) =>
                      Center(child: Text("No Image")),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                art.source.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              art.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
