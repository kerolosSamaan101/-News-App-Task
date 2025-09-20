import 'package:newsapp/BLoC/NewsStates.dart';

abstract class NewsEvent {}

class GetNews extends NewsEvent {}

class ChooseNews extends NewsEvent {
  final News news;
  ChooseNews(this.news);
}
