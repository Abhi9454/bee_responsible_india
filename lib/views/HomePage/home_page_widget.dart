import 'package:beeresponsibleindia/views/HomePage/Widget/home_page_list_container.dart';
import 'package:flutter/material.dart';

import '../../config.dart';


class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          itemCount: 100,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const HomePageListContainer(colorCode: 2, chemicalName: '2,4-Dichlorophenoxy Acetic Acid (2,4-D Sodium Amine and Easter Salt)', chemicalDescription: 'Alkylchlorophenoxy herbicide');
          },
        ),
      ),
    );
  }
}
