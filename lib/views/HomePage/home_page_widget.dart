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
                                        return GestureDetector(
                                          onTap: () {
                                            if (homePageModel.userStatus ==
                                                HomePageUserStatus
                                                    .userVerified) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsPageWidget(
                                                              chemicalDetails:
                                                                  homePageModel
                                                                          .products[
                                                                      index])));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPageWidget()));
                                            }
                                          },
                                          child: HomePageListContainer(
                                              colorCode: homePageModel
                                                  .products[index]
                                                  .chemicalColor,
                                              chemicalName: homePageModel
                                                  .products[index]
                                                  .chemicalIngredients,
                                              chemicalDescription: homePageModel
                                                  .products[index]
                                                  .chemicalGroup),
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
                                            return GestureDetector(
                                              onTap: () {
                                                if (homePageModel.userStatus ==
                                                    HomePageUserStatus
                                                        .userVerified) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailsPageWidget(
                                                                  chemicalDetails:
                                                                      homePageModel
                                                                              .products[
                                                                          index])));
                                                } else {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPageWidget()));
                                                }
                                              },
                                              child: HomePageListContainer(
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
