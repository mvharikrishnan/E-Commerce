part of 'search_bloc.dart';

@immutable
class SearchState {
  SearchState({required this.productList,required this.initalList});
  List<ProductModel> productList;
  List<ProductModel> initalList;
}

class InitialState extends SearchState {
  InitialState() : super(productList: [],initalList: []);
}
