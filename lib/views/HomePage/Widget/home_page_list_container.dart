import 'package:flutter/material.dart';

class HomePageListContainer extends StatelessWidget {
  const HomePageListContainer(
      {required this.colorCode,
      required this.chemicalName,
      required this.chemicalDescription,
      Key? key})
      : super(key: key);

  final String colorCode;
  final String chemicalName;
  final String chemicalDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorCode == 'white'
            ? Colors.white
            : colorCode == 'red'
                ? Colors.redAccent
                : colorCode == 'yellow'
                    ? Colors.yellowAccent
                    : Colors.lightGreenAccent,
        border: const Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chemicalName,
                      maxLines: 5,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      chemicalDescription,
                      maxLines: 5,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Image(
                  image: AssetImage(
                    colorCode == 'yellow'
                        ? 'images/yellow.jpg'
                        : colorCode == 'red'
                            ? 'images/red.jpg'
                            : colorCode == 'green'
                                ? 'images/green.jpg'
                                : 'images/blank.jpg', //header logo image
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          )),
    );
  }
}
