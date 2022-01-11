import '../../main.dart';
import '../../views/HomePage/home_page_widget.dart';
import '../../views/LoginPage/login_page_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../config.dart';
import '../../helpers/enum.dart';

import '../../viewModels/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RegisterPageWidget extends StatelessWidget {
  RegisterPageWidget({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterPageViewModel>(
      create: (context) => RegisterPageViewModel(),
      child: Consumer<RegisterPageViewModel>(
        builder: (con, registerModel, _) {
          if (registerModel.registerStatus == RegisterStatus.success) {
            return const NavigationTab();
          } else {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
                  backgroundColor: AppConfig().primaryColor,
                  leading: IconButton(
                    icon: const Icon(CupertinoIcons.back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: const Text(
                    'Enter Details',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
              body: SafeArea(
                child: registerModel.registerStatus == RegisterStatus.loading
                    ? const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      registerModel.registerStatus ==
                          RegisterStatus.failed
                          ? Text(
                        registerModel.registerErrorMessage,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18),
                      )
                          : registerModel.registerStatus ==
                          RegisterStatus.error
                          ? Text(
                        registerModel.error.message,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18),
                      )
                          : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: TextFormField(
                                  autofocus: false,
                                  controller: nameController,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: const InputDecoration(
                                      hintText: 'Full Name',
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: TextFormField(
                                  autofocus: false,
                                  controller: emailController,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: const InputDecoration(
                                      hintText: 'Email',
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: TextFormField(
                                  autofocus: false,
                                  controller: mobileController,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: const InputDecoration(
                                      hintText: 'Mobile Number',
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: TextFormField(
                                  autofocus: false,
                                  obscureText: false,
                                  controller: cityController,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: const InputDecoration(
                                      hintText: 'City',
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: TextFormField(
                                  autofocus: false,
                                  obscureText: false,
                                  controller: stateController,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: const InputDecoration(
                                      hintText: 'State',
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: TextFormField(
                                  autofocus: false,
                                  obscureText: false,
                                  controller: professionController,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: const InputDecoration(
                                      hintText: 'Profession',
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 0.0),
                                      ),),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.5,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (nameController.text.isNotEmpty &&
                                        emailController.text.isNotEmpty &&
                                        mobileController
                                            .text.isNotEmpty &&
                                        cityController
                                            .text.isNotEmpty &&
                                        stateController
                                            .text.isNotEmpty && professionController.text.isNotEmpty) {
                                      registerModel.register(
                                          nameController.text,
                                          emailController.text,
                                          mobileController.text,
                                          cityController.text,stateController.text,professionController.text);
                                    } else {
                                      final snackBar = SnackBar(
                                        content: const Text(
                                          'Empty Fields....',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                        backgroundColor:
                                        (AppConfig().primaryColor),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  child: const Text(
                                      'Register'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    primary: AppConfig().primaryColor,
                                    padding: const EdgeInsets.all(15),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPageWidget()));
                                  },
                                  child: const Text(
                                      'Already a member? Sign In')),
                              const SizedBox(
                                height: 25,
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
