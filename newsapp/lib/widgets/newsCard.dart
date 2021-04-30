import 'package:flutter/material.dart';
import 'package:newsapp/provider/favouriteProvider.dart';
import 'package:newsapp/ui/details.dart';
import 'package:provider/provider.dart';

class NewsCard extends StatelessWidget {
  final int index;
  final String urlToImage, title, url, author, description, content, from;
  final bool status;

  NewsCard({
    this.urlToImage = '',
    this.title = '',
    this.url = '',
    this.author = '',
    this.description = '',
    this.content = '',
    this.status = false,
    this.index,
    this.from,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return NewsDetails(title, urlToImage, author, description, content,
              url, status, index, from);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  child: Image.network(urlToImage, height: 120, width: 100)),
              Padding(padding: EdgeInsets.only(left: 8)),
              Flexible(
                child: Container(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.favorite,
                      color: status ? Colors.blue : Colors.grey),
                  onPressed: () {
                    var getFavList =
                        Provider.of<FavouriteList>(context, listen: false);
                    color:
                    status
                        ? getFavList.removeFromFavList(title)
                        : getFavList.addToFavourite(title);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
