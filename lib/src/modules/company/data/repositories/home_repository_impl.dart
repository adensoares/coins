// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../../domain/repositories/home_repository.dart';

// class HomeRepositoryImpls implements HomeRepository {
//   Future<List> getCompanyList() async {
//     var url = Uri.parse(
//         'https://api.hgbrasil.com/finance/stock_price?key=ea5df40a&symbol=$code');
//     final response = await http.get(url);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       List companyList = json['companyList'];
//       return companyList;
//     } else {
//       return [];
//     }
//   }
// }
