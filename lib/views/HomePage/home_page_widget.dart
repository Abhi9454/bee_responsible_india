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
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextField(
                                  controller: searchText,
                                  autofocus: false,
                                  onChanged: (String value) {
                                    homePageModel.searchItem(value);
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Search Here...',
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                              homePageModel.searchText.isEmpty
                                  ? ListView.builder(
                                      itemCount: homePageModel.products.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: ExpansionTile(
                                            title: HomePageListContainer(
                                                colorCode: homePageModel
                                                    .products[index]
                                                    .chemicalColor,
                                                chemicalName: homePageModel
                                                    .products[index]
                                                    .chemicalIngredients,
                                                chemicalDescription:
                                                    homePageModel
                                                        .products[index]
                                                        .chemicalGroup),
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
                                                    : homePageModel
                                                                .products[index]
                                                                .chemicalColor ==
                                                            'yellow'
                                                        ? Colors.yellowAccent
                                                        : Colors
                                                            .lightGreenAccent,
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                homePageModel.products[index]
                                                    .chemicalName,
                                                textAlign: TextAlign.left,
                                                maxLines: 5,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                homePageModel.products[index]
                                                    .chemicalGroup,
                                                textAlign: TextAlign.left,
                                                maxLines: 5,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                'Residual Toxicity',
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                  : homePageModel.searchedProduct.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: homePageModel
                                              .searchedProduct.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: ExpansionTile(
                                                title: HomePageListContainer(
                                                    colorCode: homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalColor,
                                                    chemicalName: homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalIngredients,
                                                    chemicalDescription:
                                                        homePageModel
                                                            .searchedProduct[
                                                                index]
                                                            .chemicalGroup),
                                                leading: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                                trailing:
                                                    const SizedBox.shrink(),
                                                collapsedBackgroundColor: homePageModel
                                                            .searchedProduct[
                                                                index]
                                                            .chemicalColor ==
                                                        'white'
                                                    ? Colors.white
                                                    : homePageModel
                                                                .searchedProduct[
                                                                    index]
                                                                .chemicalColor ==
                                                            'red'
                                                        ? Colors.redAccent
                                                        : homePageModel
                                                                    .searchedProduct[
                                                                        index]
                                                                    .chemicalColor ==
                                                                'yellow'
                                                            ? Colors
                                                                .yellowAccent
                                                            : Colors
                                                                .lightGreenAccent,
                                                children: [
                                                  Text(
                                                    homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalIngredients,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 5,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalSearchTerm,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 5,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalName,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 5,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalGroup,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 5,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                    'Residual Toxicity',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalResidual,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 5,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    homePageModel
                                                        .searchedProduct[index]
                                                        .chemicalApplicators,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 5,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                      : const Text('No Items Found'),
                            ],
                          ),
                        )
                      : const SizedBox();
        },
      ),
    );
  }
}
