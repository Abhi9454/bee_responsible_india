import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';

class AboutPageWidget extends StatelessWidget {
  const AboutPageWidget({Key? key}) : super(key: key);

  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'foodprintgreen@gmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      log('Could not launch $url');
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
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
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
                  'foodprintgreen@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueAccent),
                ),
              ),
              const SizedBox(
                height: 10,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Sajiv Anand, FoodPrint India',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Arnob Chatterjee, University of Calcutta',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Nina Rudin, Oklahoma State University',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Nina Rudin, Oklahoma State University',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Matthew Bucy, Oregon State University',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
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
    );
  }
}
