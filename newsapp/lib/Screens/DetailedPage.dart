import 'package:flutter/material.dart';
import 'package:newsapp/BLoC/NewsStates.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailedpage extends StatefulWidget {
  final News article;
  const Detailedpage({super.key, required this.article});

  @override
  State<Detailedpage> createState() => _DetailedpageState();
}

class _DetailedpageState extends State<Detailedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detailed Page",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // News Image
              SizedBox(
                height: 200,
                width: double.infinity,
                child: widget.article.imageUrl.isNotEmpty
                    ? Image.network(widget.article.imageUrl)
                    : const Icon(Icons.hide_image_outlined),
              ),
              SizedBox(
                height: 15,
              ),

              // News Title
              Text(
                widget.article.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              // News description
              Text(widget.article.description),

              SizedBox(
                height: 25,
              ),
              // Button to open the full article in the browser
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () async {
                  final Uri url = Uri.parse(widget.article.url);
                  await launchUrl(url, mode: LaunchMode.platformDefault);
                },
                child: const Text(
                  "Go to Article",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
