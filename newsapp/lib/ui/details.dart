import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/provider/favouriteProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  final int index;
  final String title, image, author, description, content, url, from;
  final bool status;

  NewsDetails(this.title, this.image, this.author, this.description,
      this.content, this.url, this.status, this.index, this.from);

  void openUrl() async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.grey[50],
        title: (Text(
          'NEWSAPP',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 10),
        child: Container(
          child: Consumer<FavouriteList>(builder: (context, list, child) {
            var statusIndicator = from == 'home' ? list.newsList : list.favList;
            return Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Title(
                        color: Colors.black,
                        child: Text(title, style: TextStyle(fontSize: 20)))),
                Align(
                    alignment: Alignment.centerRight,
                    child: from == 'home'
                        ? IconButton(
                            icon: Icon(Icons.favorite,
                                color: statusIndicator[index].status
                                    ? Colors.blue
                                    : Colors.grey),
                            onPressed: () {
                              var getFavList = Provider.of<FavouriteList>(
                                  context,
                                  listen: false);
                              color:
                              statusIndicator[index].status
                                  ? getFavList.removeFromFavList(title)
                                  : getFavList.addToFavourite(title);
                            })
                        : null),
                SizedBox(height: 10),
                FittedBox(child: Image.network(image), fit: BoxFit.fill),
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Title(
                        color: Colors.grey[500],
                        child:
                            Text(description, style: TextStyle(fontSize: 15)))),
                Padding(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Title(
                        color: Colors.grey[500],
                        child: Text(content, style: TextStyle(fontSize: 15)))),
                SizedBox(height: 20),
                FlatButton(
                  child:
                      Text('Open in browser', style: TextStyle(fontSize: 15)),
                  color: Colors.blue[400],
                  onPressed: () {
                    openUrl();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
