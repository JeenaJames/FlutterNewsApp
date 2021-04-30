import 'package:flutter/material.dart';
import 'package:newsapp/provider/favouriteProvider.dart';
import 'package:newsapp/widgets/newsCard.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        toolbarHeight: 60,
        title: (Center(
            child: Text(
          'FAVOURITE',
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
                  child:
                      Consumer<FavouriteList>(builder: (context, list, child) {
                    if (list.favList.length <= 0) {
                      return Center(child:Card(
                          elevation: 100,
                          shadowColor: Colors.grey[200],
                          color: Colors.grey[400],
                          child: Padding(
                          padding: EdgeInsets.all(100),
                          child:Text('No data to display')
                      )));
                    }
                    return ListView.builder(
                        itemCount: list.favList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsCard(
                            title: list.favList[index].title,
                            urlToImage: list.favList[index].urlToImage,
                            url: list.favList[index].articleUrl,
                            author: list.favList[index].author ?? '',
                            description: list.favList[index].description ?? '',
                            content: list.favList[index].content ?? '',
                            status: list.favList[index].status ?? false,
                            index: index,
                            from: 'favourites',
                          );
                        });
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
