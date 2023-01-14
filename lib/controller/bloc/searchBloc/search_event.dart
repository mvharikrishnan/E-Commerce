part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchProduct extends SearchEvent {
  SearchProduct({required this.input});
  String input;
}

class InitailSearchList extends SearchEvent {
  InitailSearchList({required this.list});
  List<ProductModel> list;
}
