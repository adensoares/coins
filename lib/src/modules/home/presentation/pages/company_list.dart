import 'package:coins/src/modules/home/data/model/company.dart';
import 'package:flutter/material.dart';

class CompanyList extends StatelessWidget {
  const CompanyList({Key? key, required this.companies}) : super(key: key);

  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: companies.length,
      itemBuilder: (context, index) {
        return Text(companies[index].name);
      },
    );
  }
}
