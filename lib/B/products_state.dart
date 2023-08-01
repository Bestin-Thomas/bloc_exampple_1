

part of 'products_bloc.dart';
// @immutable
class ProductsState {

   List<Products> props=[];
   ProductsState({required this.props});
   // ProductsState({required this.props});
}

class Productsloaded extends ProductsState {

  Productsloaded():super(props:[]);

}
// class ProductsError extends ProductsState{
//   late final String error;
//   ProductsError(this.error);
//   @override
//   List<Object?> get props=>[error];
// }

//
// class CounterState {
//   late int count;
//   CounterState({required this.count});
// }
//
// class CounterInitial extends CounterState {
//   CounterInitial():super(count: 0);
// }
//
// abstract class UserState extends Equatable {}
// class UserLoadingState extends UserState {
//   @override
//   List<Object?> get props => [];
// }
//
//
// class UserLoadedState extends UserState {
//   final List<UserModel> users;
//   UserLoadedState(this.users);
//   @override
//   List<Object?> get props => [users];
// }
//
// class UserErrorState extends UserState {
//   final String error;
//   UserErrorState(this.error);
//   @override
//   List<Object?> get props => [error];
// }