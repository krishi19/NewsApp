import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    // print('image : ${newsModel.urlToImage}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News Detail'),
        flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[ Colors.blue, Colors.white,]),
      ),
    ),
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
              'Author: ${newsModel.author}',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Published At: ${newsModel.publishedAt}',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 30,
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
