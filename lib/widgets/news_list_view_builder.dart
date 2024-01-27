import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';

import '../componants/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });
final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>> (
        future:future,
        builder: (context , snapshot)
        {
         if(snapshot.hasData)
         {
           return NewsListView(articles:snapshot.data!,);
         }else if(snapshot.hasError)
         {
          return const SliverToBoxAdapter(
                child: Center(
                    child: Text(
                      'Oops! there was an error⚠️, please try later',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
          ),
          );
         }else
         {
           return const SliverToBoxAdapter(
             child: Center(
               child: CircularProgressIndicator(
                   color: Colors.deepOrange,
               ),
             ),
           );
        }
        },
    );
    // return isLoading
    //     ? const SliverToBoxAdapter(
    //     child: Center(child: CircularProgressIndicator(color: Colors.deepOrange,))
    // )
    //     :articles.isNotEmpty ? NewsListView(articles:articles,): const SliverToBoxAdapter(
    //   child: Center(
    //       child: Text(
    //         'Oops! there was an error⚠️, please try later',
    //         style: TextStyle(
    //           fontSize: 18,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.red,
    //         ),
    //       ),
    //   ),
    // );
  }
}