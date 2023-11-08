import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shoppie/model/product.dart';
import 'package:shoppie/model/user.dart';

class ApiServices {
  static String getAllProducts = 'https://fakestoreapi.com/products';
  static String deleteProductUrl = 'https://fakestoreapi.com/products/';
  static String getAllCategory = 'https://fakestoreapi.com/products/categories';
  static String getByCategory = 'https://fakestoreapi.com/products/category/';
  static String getUserUrl = 'https://fakestoreapi.com/users/1';

  Future<List<Product>> fetchAllProducts() async {
    try {
      final response = await http.get(Uri.parse(getAllProducts));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final result = jsonDecode(response.body) as List;
        final products = <Product>[];
        for (int i = 0; i < result.length; i++) {
          final product = Product.fromJson(result[i]);
          products.add(product);
        }
        return products;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<String>> getAllCategories() async {
    try {
      final response = await http.get(Uri.parse(getAllCategory));
      final categories = <String>[];
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final result = jsonDecode(response.body) as List;
        for (int i = 0; i < result.length; i++) {
          categories.add(result[i]);
        }
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Product>> fetchByCategory(String category) async {
    try {
      final response = await http.get(Uri.parse(getByCategory + category));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final result = jsonDecode(response.body) as List;
        final products = <Product>[];
        for (int i = 0; i < result.length; i++) {
          final product = Product.fromJson(result[i]);
          products.add(product);
        }
        return products;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> updateProduct(Product product) async {
    try {
      final body = {
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'image': product.image,
        'category': product.category,
      };
      final response = await http
          .put(Uri.parse('$getAllProducts/${product.id}'), body: body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> patchProduct(Product product) async {
    try {
      final body = {
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'image': product.image,
        'category': product.category,
      };
      final response = await http
          .patch(Uri.parse('$getAllProducts/${product.id}'), body: body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> deleteProduct(int id) async {
    try {
      final response =
          await http.delete(Uri.parse(deleteProductUrl + id.toString()));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<User> getUser() async {
    try {
      final response = await http.get(Uri.parse(getUserUrl));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        final user = User.fromJson(result);
        return user;
      }
      return User(
          id: 0, email: '', username: '', password: '', name: '', phone: '');
    } catch (e) {
      log(e.toString());
      return User(
          id: 0, email: '', username: '', password: '', name: '', phone: '');
    }
  }
}
