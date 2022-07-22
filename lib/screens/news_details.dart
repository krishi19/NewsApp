import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    print('image : ${newsModel.urlToImage}');
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              newsModel.urlToImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              cacheHeight: 350,
              loadingBuilder: (c, w, cp) {
                if (cp != null) {
                  return SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
                return w;
              },
              errorBuilder: (c, w, cp) {
                return SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              newsModel.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              newsModel.description,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              newsModel.content,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}