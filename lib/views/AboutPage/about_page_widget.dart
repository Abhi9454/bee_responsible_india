import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';

class AboutPageWidget extends StatelessWidget {
  const AboutPageWidget({Key? key}) : super(key: key);

  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'info@beeresponsibleindia.org',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      log('Could not launch $url');
    }
  }

  void _launchUrlEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'louisa.hooven@oregonstate.edu',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      log('Could not launch $url');
    }
  }


  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    )) {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('About'),
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
                  'Contact Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: const Text(
                    'info@beeresponsibleindia.org',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    _launchUrlEmail();
                  },
                  child: const Text(
                    'louisa.hooven@oreganonstate.edu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'For More Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'The bee toxicity information in this app comes from PNW591.',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'How to Reduce Bee Poisoning from Pesticides : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    _launchInWebViewOrVC('https://catalog.extension.oregonstate.edu/pnw591');
                  },
                  child: const Text(
                    'https://catalog.extension.oregonstate.edu/pnw591',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'USEPA:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    _launchInWebViewOrVC('https://www.epa.gov/pollinator-protection/how-we-assess-risks-pollinators');
                  },
                  child: const Text(
                    'https://www.epa.gov/pollinator-protection/how-we-assess-risks-pollinators',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    _launchInWebViewOrVC('https://www.epa.gov/pollinator-protection/residual-time-25-bee-mortality-rt25-data');
                  },
                  child: const Text(
                    'https://www.epa.gov/pollinator-protection/residual-time-25-bee-mortality-rt25-data',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Pesticide Properties Data Base:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    _launchInWebViewOrVC('https://sitem.herts.ac.uk/aeru/ppdb');
                  },
                  child: const Text(
                    'https://sitem.herts.ac.uk/aeru/ppdb',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'and other sources.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Authors',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Louisa Hooven, Oregon State University',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'Sajiv Anand, FoodPrint India',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Arnob Chatterjee, University of Calcutta',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Nina Rudin, Oklahoma State University',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Nina Rudin, Oklahoma State University',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'With help and contribution from:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Priyadarshini Chakrabarti, Oregon State University',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Matthew Bucy, Oregon State University',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'How to cite this app:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Hooven, L. A., Anand, S., Chatterjee, A., Rudin, N. (2021).BeeSafety India (1.0) [Mobile app]. http://beeresponsibleindia.org/',
                  maxLines: 4,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
