import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:newsapp/network/news.dart';

class FavouriteList extends ChangeNotifier {
  final newsList = [];
  final favList = [];
  bool isLoading = false;

  fetchNewsList() async {
    News news = News();
    await news.getNews();
    print(listEquals(newsList,news.news));
    if (newsList.length == 0) {
      newsList.addAll(news.news);
      isLoading = true;
    } else if (newsList.length > 0 && listEquals(newsList,news.news)){
      newsList.removeRange(0, newsList.length);
      newsList.addAll(news.news);
      isLoading = true;
    }
    notifyListeners();
  }

  addToFavourite(title) async {
    favList.removeRange(0, favList.length);
    for (var i = 0; i < newsList.length; i++) {
      if (newsList[i].title == title) {
        newsList[i].status = true;
      }
    }
    for (var i = 0; i < newsList.length; i++) {
      if (newsList[i].status) {
        favList.add(newsList[i]);
      }
    }
    notifyListeners();
  }

  removeFromFavList(title) async {
    favList.removeRange(0, favList.length);
    for (var i = 0; i < newsList.length; i++) {
      if (newsList[i].title == title) {
        newsList[i].status = false;
      }
    }
    for (var i = 0; i < newsList.length; i++) {
      if (newsList[i].status) {
        favList.add(newsList[i]);
      }
    }
    notifyListeners();
  }
}
