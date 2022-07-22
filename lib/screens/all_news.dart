import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:newsapp/screens/news_details.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
         centerTitle: true,
          title: Text(' ALL NEWS',
              style: TextStyle(
                color: Colors.white,
              )
              ),
               flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[ Colors.blue, Colors.white,]),
      ),
    ),
              ),
      body: FutureBuilder<List<NewsModel>>(
          future: NewsRepository().getAllNews(),
          builder: (context, newsSnap) {
            if (newsSnap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              );
            }
            List<NewsModel> newsList = [];
            if (newsSnap.hasData) {
              if (newsSnap.data != null) {
                newsList = newsSnap.data ?? [];
              }
            }
            if (newsList.isEmpty) {
              return const Center(
                child: Text(
                  'No data!',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return ListView.separated(
              itemCount: newsList.length,
              padding: EdgeInsets.all(10),
              separatorBuilder: (ctx, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemBuilder: (ctx, index) {
                final news = newsList[index];
                return Card(
                  margin: EdgeInsets.zero,
                  elevation: 3,
                  child: ListTile(
                    leading: Image.network(
                      news.urlToImage,
                      width: 50,
                      height: 50,
                      cacheHeight: 250,
                      fit: BoxFit.cover,
                      key: Key(news.title),
                      loadingBuilder: (c, w, cp) {
                        if (cp != null) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          );
                        }
                        return w;
                      },
                      errorBuilder: (c, w, cp) {
                        return SizedBox(
                          width: 50,
                          height: 50,
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
                    title: Text(
                      news.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      news.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      print('index: $index');
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (ctx) => NewsDetails(newsModel: news),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
