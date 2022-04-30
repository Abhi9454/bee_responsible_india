import '../../views/DetailPage/detail_page_widget.dart';
import '../../views/LoginPage/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../helpers/enum.dart';
import '../../viewModels/home_page_view_model.dart';
import '../../views/HomePage/Widget/home_page_list_container.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({Key? key}) : super(key: key);

  final TextEditingController searchText = TextEditingController();
  final GlobalKey _productKey = GlobalKey();
  final GlobalKey _searchKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageViewModel>(context, listen: false).init();
    Provider.of<HomePageViewModel>(context, listen: false).fetchProductList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: Consumer<HomePageViewModel>(
        builder: (con, homePageModel, _) {
          return homePageModel.status == Status.loading
              ? const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
              : homePageModel.status == Status.error
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          homePageModel.error.message,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    )
                  : homePageModel.status == Status.success
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: TextFormField(
                                          controller: searchText,
                                          autofocus: false,
                                          decoration: InputDecoration(
                                            hintText: 'Search Here...',
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                searchText.clear();
                                                homePageModel.clearSearch();
                                              },
                                              icon: const Icon(Icons.clear),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (searchText.text.isNotEmpty) {
                                            homePageModel
                                                .searchItem(searchText.text);
                                          }
                                        },
                                        child: const Text('Search'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          primary: AppConfig().primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (homePageModel.searchedProduct.isEmpty)
                                ListView.builder(
                                  key: _productKey,
                                  itemCount: homePageModel.products.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: ExpansionTile(
                                        title: HomePageListContainer(
                                            colorCode: homePageModel
                                                .products[index].chemicalColor,
                                            chemicalName: homePageModel
                                                .products[index]
                                                .chemicalIngredients,
                                            chemicalGroup: homePageModel
                                                .products[index]
                                                .chemicalGroup,
                                            chemicalDescription: homePageModel
                                                .products[index].chemicalGroup),
                                        leading: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        trailing: const SizedBox.shrink(),
                                        collapsedBackgroundColor: homePageModel
                                                    .products[index]
                                                    .chemicalColor ==
                                                'white'
                                            ? Colors.white
                                            : homePageModel.products[index]
                                                        .chemicalColor ==
                                                    'red'
                                                ? Colors.redAccent
                                                : homePageModel.products[index]
                                                            .chemicalColor ==
                                                        'yellow'
                                                    ? Colors.yellowAccent
                                                    : Colors.lightGreenAccent,
                                        children: [
                                          Text(
                                            homePageModel.products[index]
                                                .chemicalIngredients,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Alternate Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.products[index]
                                                .chemicalSearchTerm,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Common Product Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel
                                                .products[index].chemicalName,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Chemical Group',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel
                                                .products[index].chemicalGroup,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Residual Toxicity(For Bees)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.products[index]
                                                .chemicalResidual,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Applicator Warning',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.products[index]
                                                .chemicalApplicators,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              else if (homePageModel.searchedProduct.isNotEmpty)
                                ListView.builder(
                                  key: _searchKey,
                                  itemCount:
                                      homePageModel.searchedProduct.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: ExpansionTile(
                                        title: HomePageListContainer(
                                            colorCode: homePageModel
                                                .searchedProduct[index]
                                                .chemicalColor,
                                            chemicalName: homePageModel
                                                .searchedProduct[index]
                                                .chemicalIngredients,
                                            chemicalGroup: homePageModel
                                                .searchedProduct[index]
                                                .chemicalGroup,
                                            chemicalDescription: homePageModel
                                                .searchedProduct[index]
                                                .chemicalGroup),
                                        leading: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        trailing: const SizedBox.shrink(),
                                        collapsedBackgroundColor: homePageModel
                                                    .searchedProduct[index]
                                                    .chemicalColor ==
                                                'white'
                                            ? Colors.white
                                            : homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalColor ==
                                                    'red'
                                                ? Colors.redAccent
                                                : homePageModel
                                                            .searchedProduct[
                                                                index]
                                                            .chemicalColor ==
                                                        'yellow'
                                                    ? Colors.yellowAccent
                                                    : Colors.lightGreen,
                                        children: [
                                          Text(
                                            homePageModel.searchedProduct[index]
                                                .chemicalIngredients,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            'Alternate Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.searchedProduct[index]
                                                .chemicalSearchTerm,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Common Product Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.searchedProduct[index]
                                                .chemicalName,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Chemical Group',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.searchedProduct[index]
                                                .chemicalGroup,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Residual Toxicity(For Bees)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.searchedProduct[index]
                                                .chemicalResidual,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Applicator Warning',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homePageModel.searchedProduct[index]
                                                .chemicalApplicators,
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                            ],
                          ),
                        )
                      : const SizedBox();
        },
      ),
    );
  }
}
