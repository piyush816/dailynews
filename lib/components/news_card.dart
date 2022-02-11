import 'package:dailynews/screens/news_detail_screen.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, this.news}) : super(key: key);
  final news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewsDetailScreen(url: news["url"], title: news["title"])));
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              news["urlToImage"],
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              news["title"],
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
