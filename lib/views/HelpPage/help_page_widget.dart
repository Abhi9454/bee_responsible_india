import 'package:flutter/material.dart';

import '../../config.dart';

class HelpPageWidget extends StatelessWidget {
  const HelpPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Help'),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Searching',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Enter all or part of a Chemical or Product name in search Box on the Home Page. Click on the chemical to know more details.',
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: const Image(
                    image: AssetImage(
                      'images/search_help.jpeg', //header logo image
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Tap plus symbol to see more information about a chemical or minus symbol to see less.',
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Navigation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Tap the buttons at the bottom to go to the beginning of each section of the app. The light grey box tells you what page you are on.',
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Color codes and Icons',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'The chemicals listed in the app are color coded (red, yellow, or green) and have an icon based on their toxicity to bees. Tap the KEY button for more information.',
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
