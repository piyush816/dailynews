import 'dart:convert';
import 'package:dailynews/components/news_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewsList();
  }
}

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final newsList = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=API_KEY");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      newsList.addAll(data["articles"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return newsList.isNotEmpty
        ? ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return NewsCard(
                news: news,
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(
            color: Colors.teal,
          ));
  }
}
