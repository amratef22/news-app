import 'package:flutter/material.dart';
import 'package:news_app/componants/categories_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                'News ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
             Text(
                'Cloud',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      body:
       const Padding(
        padding: EdgeInsets.all(14),
        child: CustomScrollView(
          slivers:
          [
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            NewsListViewBuilder(category: 'general',),
          ],
        ),
      ) ,
    );
  }
}

