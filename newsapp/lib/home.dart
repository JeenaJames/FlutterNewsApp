import 'package:flutter/material.dart';
import 'newsCard.dart';
import 'news.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
  }

  @override
  void initState() {
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[50], 
        title: (Center(child: Text('NEWSAPP',
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ))),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: newslist.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsCard(
                        title: newslist[index].title,
                        urlToImage: newslist[index].urlToImage,
                        url: newslist[index].articleUrl,
                        author: newslist[index].author ?? '',
                        description: newslist[index].description,
                        content: newslist[index].content,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

