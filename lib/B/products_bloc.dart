import 'dart:async';
// import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled19/Repo.dart';

import '../D/Products.dart';

// import '../D/Resp.dart';
// import '../Repo.dart';
part 'products_event.dart';
part 'products_state.dart';

// class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
//   final ProductRepository _productRepository;
//   ProductsBloc(this._productRepository) : super(Productsloaded()) {
//     on<LoadProductEvent>((event, emit) {
//       emit(Productsloaded());
//       try{
//         final prd variableName = ;
//       }
//       // TODO: implement event handler
//     });
//   }
// }

class UserBloc extends Bloc<LoadProductEvent, ProductsState> {
  final ProductRepository _productRepository;
  UserBloc(this._productRepository) : super(Productsloaded()) {
    on<LoadProductEvent>((event, emit) async {
  var nc=await _productRepository.fetchProducts();
      return emit(ProductsState(props:nc ));
    });

  }
}

// UserBloc(this._userRepository) : super(UserLoadingState()) {
// on<LoadUserEvent>((event, emit) async {
// emit(UserLoadingState());
// try {
// final users = await _userRepository.getUsers();
// emit(UserLoadedState(users));
// } catch (e) {
// emit(UserErrorState(e.toString()));
// }
// });
// }