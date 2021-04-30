import 'package:flutter/material.dart';
import 'package:newsapp/provider/favouriteProvider.dart';
import 'package:newsapp/widgets/newsCard.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    var getNewsList = Provider.of<FavouriteList>(context, listen: false);
    getNewsList.fetchNewsList();
  }

  Future<Null> onRefreshList() async {
    var getNewsList = Provider.of<FavouriteList>(context, listen: false);
    getNewsList.fetchNewsList();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        toolbarHeight: 60,
        title: (Center(
            child: Text(
          'NEWS APP',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ))),
      ),
      body: Consumer<FavouriteList>(builder: (context, list, child) {
         return !list.isLoading ? Center(
          child: CircularProgressIndicator(
          backgroundColor: Colors.blue[200], strokeWidth: 5)
        ) :
       RefreshIndicator(
        onRefresh: onRefreshList,
        child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: list.newsList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsCard(
                      title: list.newsList[index].title,
                      urlToImage: list.newsList[index].urlToImage,
                      url: list.newsList[index].articleUrl,
                      author: list.newsList[index].author ?? '',
                      description: list.newsList[index].description ?? '',
                      content: list.newsList[index].content ?? '',
                      status: list.newsList[index].status ?? false,
                      index: index,
                      from: 'home',
                    );
                  }
                ),
              ),
            ],
          ),
        )));
      }),
    );
  }
}
