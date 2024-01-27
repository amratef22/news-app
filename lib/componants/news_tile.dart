import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
          [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(articleModel.image?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7vlxc23whnpsnYqqppUQ0_dMGVfPsde6DHw&usqp=CAU',
              height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),



            ),
            const SizedBox(
              height: 12,
            ),
             Text(
               articleModel.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              articleModel.subTitle??'....................',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
    );

  }
}
