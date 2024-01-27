import 'package:flutter/material.dart';
import 'package:news_app/componants/category_card.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
final List<CategoryModel> categories=const
[
CategoryModel(image: 'assets/business.jpg', name: 'Business'),
CategoryModel(image: 'assets/entertaiment.jpg', name: 'Entertainment'),
CategoryModel(image: 'assets/science.jpg', name: 'Science'),
CategoryModel(image: 'assets/sports.jpg', name: 'Sports'),
CategoryModel(image: 'assets/technology.jpeg', name: 'Technology'),
CategoryModel(image: 'assets/general.jpg', name: 'General'),
];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 85,
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index)
          {
            return  CategoryCard(
              category: categories[index],
            );
          }
      ),
    );
  }
}
