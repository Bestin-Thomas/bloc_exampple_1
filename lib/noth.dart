import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/D/Products.dart';
import 'package:untitled19/Repo.dart';

import 'B/products_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(ProductRepository()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(title: const Text('The BloC App')),
          body: blocBody()),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        ProductRepository(),
      )..add(LoadProductEvent()),
      child: BlocBuilder<UserBloc, ProductsState>(
        builder: (context, state) {
          if (state is Productsloaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // if (state is UserErrorState) {
          //   return const Center(child:  Text("Error"));
          // }
          // if (state is Productsloaded) {
            List<Products> userList = state.props;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${userList[index].title}  ',
                              style: const TextStyle(color: Colors.white),
                            ),

                            subtitle: Text(
                              '${userList[index].price}',
                              style: const TextStyle(color: Colors.white),
                            ),

                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].thumbnail.toString()),
                            ))),
                  );
                });
          // }

          // return Container();
        },
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<UserBloc>(
//           create: (BuildContext context) => UserBloc(UserRepository()),
//         ),
//       ],
//       child: Scaffold(
//           appBar: AppBar(title: const Text('The BloC App')),
//           body: blocBody()),
//     );
//   }
//
//   Widget blocBody() {
//     return BlocProvider(
//       create: (context) => UserBloc(
//         UserRepository(),
//       )..add(LoadUserEvent()),
//       child: BlocBuilder<UserBloc, UserState>(
//         builder: (context, state) {
//           if (state is UserLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is UserErrorState) {
//             return const Center(child:  Text("Error"));
//           }
//           if (state is UserLoadedState) {
//             List<UserModel> userList = state.users;
//             return ListView.builder(
//                 itemCount: userList.length,
//                 itemBuilder: (_, index) {
//                   return Padding(
//                     padding:
//                     const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                     child: Card(
//                         color: Theme.of(context).primaryColor,
//                         child: ListTile(
//                             title: Text(
//                               '${userList[index].firstName}  ${userList[index].lastName}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
//
//                             subtitle: Text(
//                               '${userList[index].email}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
//
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(
//                                   userList[index].avatar.toString()),
//                             ))),
//                   );
//                 });
//           }
//
//           return Container();
//         },
//       ),
//     );
//   }
// }