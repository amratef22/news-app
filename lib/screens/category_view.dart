import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category, required this.barName});
final String category;
final String barName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              barName,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Text(
              ' News',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      body:
       Padding(
        padding: const EdgeInsets.all(14),
        child: CustomScrollView(
          slivers:
          [
            NewsListViewBuilder(category:category),
          ],
        ),
      ) ,
    );
  }
}
