import 'package:flutter/material.dart';

import '../../config.dart';

class KeyPageWidget extends StatelessWidget {
  const KeyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Key'),
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
                  'Each pesticide is categorized as Highly toxic, Toxic, or No Precaution for bees. This categorization is based on the scale used by the United States Environmental Protection Agency. Tap on the symbols below to learn more.',
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'We have also included some brief notes about pesticides which are particularly hazardous to human applicators, have been banned, or are restricted use. These notes do not represent complete information – read the label carefully for safety information before using any pesticide.(Examples of symbols – highly toxic, toxic, and no precaution, link to detailed explanations below)',
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                  ),
                  child: const Center(
                    child: Text(
                      'No Bee Toxicity Available',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('No Bee Toxicity Available.'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: const Image(
                            image: AssetImage(
                              'images/blank.jpg', //header logo image
                            ),
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.redAccent,
                  child: const Center(
                    child: Text(
                      'Highly Toxic to Bees',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 0.30,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: const Text(
                                'These pesticides are indicated in this app with the color red and this icon.')),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: const Image(
                            image: AssetImage(
                              'images/red.jpg', //header logo image
                            ),
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Toxic to Bees',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 0.30,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Text(
                              'These pesticides are indicated in this app with the color yellow and this icon.'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: const Image(
                            image: AssetImage(
                              'images/yellow.jpg', //header logo image
                            ),
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.22,
                  color: Colors.lightGreenAccent,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'No Bee Precautionary statement on label',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Text(
                              'These pesticides are indicated in this app with the color green and this icon.'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: const Image(
                            image: AssetImage(
                              'images/green.jpg', //header logo image
                            ),
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.redAccent,
                  child: const Center(
                    child: Text(
                      'Highly Toxic to Bees',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 1.05,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Product contains any active ingredient with an acute LD50 of 2 micrograms/bee or less. This product is highly toxic to bees exposed to direct treatment or residues on blooming crops or weeds. When bees are visiting the proposed treatment area, do not apply this product or allow it to drift to blooming crops or weeds. Tap the + symbol and scroll down to see approximately how long the pesticide remains toxic (extended residual toxicity) if known. Some pesticides may remain highly toxic for hours or days after application. The toxicity of these residues can vary with active ingredient concentration, application rate, weather, and other factors.Tap the + symbol and scroll down to see approximately how long the pesticide remains toxic (extended residual toxicity) if known. Some pesticides may remain toxic for hours or days after application. The toxicity of these residues can vary with active ingredient concentration, application rate, weather, and other factors.',
                      maxLines: 40,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Toxic to Bees',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 1.05,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Product contains any active ingredient with an acute LD50 of 2 micrograms/bee or less. This product is highly toxic to bees exposed to direct treatment or residues on blooming crops or weeds. When bees are visiting the proposed treatment area, do not apply this product or allow it to drift to blooming crops or weeds. Tap the + symbol and scroll down to see approximately how long the pesticide remains toxic (extended residual toxicity) if known. Some pesticides may remain highly toxic for hours or days after application. The toxicity of these residues can vary with active ingredient concentration, application rate, weather, and other factors.Tap the + symbol and scroll down to see approximately how long the pesticide remains toxic (extended residual toxicity) if known. Some pesticides may remain toxic for hours or days after application. The toxicity of these residues can vary with active ingredient concentration, application rate, weather, and other factors.',
                      maxLines: 40,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.22,
                  color: Colors.lightGreenAccent,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'No Precaution',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Product contains any active ingredient with an acute LD50 greater than or equal to 11 micrograms/bee.This product is considered practically non-toxic to bees exposed to direct treatment or residues on blooming crops or weeds. Residual toxicity is unlikely to be a concern.Additional research may be needed or emerge, and avoiding exposure to bees is still prudent. The majority of risk assessments are based on the response of the Western Honey Bee (Apis mellifera), and native bees and other pollinating insects may be more sensitive.',
                      maxLines: 40,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
