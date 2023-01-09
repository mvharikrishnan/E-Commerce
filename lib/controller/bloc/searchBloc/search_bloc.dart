import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/controller/searchProduct.dart';

import 'package:ecommerceapp/model/ProductModel/productModel.dart';

import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    //searching
    on<SearchProduct>((event, emit) async {
      List<ProductModel> searchedList =
          await SearchProductClass.productSearch(searchValue: event.input);

      emit(SearchState(productList: searchedList));
    });
  }
}
