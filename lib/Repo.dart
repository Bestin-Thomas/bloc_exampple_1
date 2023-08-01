import 'dart:convert';
import 'package:untitled19/D/Products.dart';

import 'D/Resp.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  String userUrl = 'https://dummyjson.com/products';
  // List<Products>prdts=[];

  Future<List<Products>> fetchProducts() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final resp = json.decode(response.body);
      var data = Resp.fromJson(resp);
      var plist = data.products;
      return plist;
    }
    else {
      throw Exception('Failed to load');
    }
  }
  // Future<List<Products>> getUsers() async {
  //   Response response = await get(Uri.parse(userUrl));
  //
  //   if (response.statusCode == 200) {
  //     final resp=json.decode(response.body.toString());
  //     var  pts=Resp.fromJson(resp);
  //     prdts=pts.products;
  //     // var plist=data.products;
  //     // prdList=data.products;
  //     // print(prdList);
  //     return prdts;
  //     // final jsonBody = jsonDecode(response.body.toString());
  //     // // var p = Resp.fromJson(jsonBody);
  //     // final List result = jsonDecode(response.body)['data'];
  //     // prdList=p.products;
  //     // return prdList;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}