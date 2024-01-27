import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices
{
  final Dio dio;
  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String category})
  async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3efad376c31c4507acefce2de448d465&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    }catch(error)
    {
      return [];
    }
  }
}