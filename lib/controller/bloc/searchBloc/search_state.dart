part of 'search_bloc.dart';

@immutable
class SearchState {
  SearchState({required this.productList});
  List<ProductModel> productList;
}

class InitialState extends SearchState {
  InitialState() : super(productList: []);
}
