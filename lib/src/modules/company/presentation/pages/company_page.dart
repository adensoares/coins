import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../home/data/model/company.dart';
import '../../../home/presentation/pages/symbols_map.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  final String symbol;

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  late Company company;
  late String? code;

  @override
  void initState() {
    super.initState();
    code = symbolsMap[widget.symbol];
  }

  Future<Map> _getStockMarket() async {
    var url = Uri.parse(
        'https://api.hgbrasil.com/finance/stock_price?key=ea5df40a&symbol=$code');
    try {
      http.Response response = await http.get(url);
      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: FutureBuilder<Map>(
              //       future: _getStockMarket(),
              //       builder: (context, snapshot) {
              //         if (snapshot.hasError) {
              //           return Center(
              //             child: Text('Error'),
              //           );
              //         }
              //         if (snapshot.hasData) {
              //           return GridView.builder(
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //             ),
              //             itemCount: snapshot.data!['results']['stocks'].length,
              //             itemBuilder: (context, index) {
              //               return Card(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text(
              //                     snapshot.data!['results']['stocks']
              //                         [list[index]]['name'],
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         }
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       },
              //     ),
              //   ),
              // )