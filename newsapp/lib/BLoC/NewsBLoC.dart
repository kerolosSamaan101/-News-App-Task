import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/BLoC/NewsEvent.dart';
import 'package:newsapp/BLoC/NewsStates.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final key = "079866dae0084c39ab44839343f1199b";
  NewsBloc() : super(InitialState()) {
    on<GetNews>((event, emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final res = await http.get(
          Uri.parse(
              'https://newsapi.org/v2/top-headlines?country=us&apiKey=$key'),
        );
        if (res.statusCode == 200) {
          final data = jsonDecode(res.body) as Map<String, dynamic>;
          final articles = (data['articles'] as List)
              .map((e) => News.fromJson(e as Map<String, dynamic>))
              .toList();

          emit(AppearedNews(articles));
        } else {
          emit(NewsError(
              'Failed to load News with sateus code : ${res.statusCode}'));
        }
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });

    on<ChooseNews>((event, emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 1));

      emit(NewsChoosed(event.news));
    });
  }
}
