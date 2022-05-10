import 'dart:convert';

import 'package:coins/src/core/widgets/primary_button_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../core/widgets/searchbar_widget.dart';
import '../../domain/usecases/home_controller.dart';
import '../../data/model/company.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  Future<Map>? _futureCompany;
  bool isLoading = false;

  Future<Map> _getCompany(symbol) async {
    var url =
        'https://api.hgbrasil.com/finance/stock_price?key=ea5df40a&symbol=$symbol';
    Uri request = Uri.parse(url);
    http.Response response = await http.get(request);
    var resDecoded = json.decode(response.body)["results"]['$symbol'];
    final company = new Map<String, dynamic>.from(resDecoded);
    print(company);
    return company;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/coins.png',
                ),
              ),
              SearchBar(
                controller: _controller,
              ),
              PrimaryButton(
                onPressed: () {
                  setState(() {
                    _futureCompany =
                        _getCompany(_controller.text.toUpperCase());
                    isLoading = true;
                  });
                },
                text: 'Buscar',
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder<Map>(
                    future: _futureCompany,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error'),
                        );
                      }
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: (1 / .5)),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'R\$ ${snapshot.data!['price'].toString()}',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      snapshot.data!['company_name'] != null
                                          ? '${snapshot.data!['company_name']} (${snapshot.data!['symbol']})'
                                          : '${snapshot.data!['name']} (${snapshot.data!['symbol']})',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
