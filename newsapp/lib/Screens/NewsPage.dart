import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/BLoC/NewsBLoC.dart';
import 'package:newsapp/BLoC/NewsEvent.dart';
import 'package:newsapp/BLoC/NewsStates.dart';
import 'package:newsapp/Screens/DetailedPage.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<NewsBloc>().add(GetNews());
  // }

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(GetNews());
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "News Page",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AppearedNews) {
            // Handling API failures
            if (state.news.isEmpty) {
              return const Center(
                child: Text("No articles available"),
              );
            }
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final news = state.news[index];
                return Card(
                  color: Colors.white,
                  child: ListTile(
                      // IMAGE of article
                      leading: news.imageUrl.isNotEmpty
                          ? Image.network(news.imageUrl,
                              width: 70, fit: BoxFit.cover)
                          : const Icon(Icons.hide_image_outlined),
                      // title of article
                      title: Text(
                        news.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // description and date of article
                      subtitle: Text(
                        "${news.description}\n${news.date.toLocal().toString().split(" ")[0]}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // make card clickable
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Detailedpage(article: news),
                          ),
                        );
                      }),
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.msg));
          }
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
