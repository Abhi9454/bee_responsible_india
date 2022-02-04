import 'package:flutter/material.dart';

class HomePageListContainer extends StatelessWidget {
  const HomePageListContainer(
      {required this.colorCode,
      required this.chemicalName,
        required this.chemicalGroup,
      required this.chemicalDescription,
      Key? key})
      : super(key: key);

  final String colorCode;
  final String chemicalName;
  final String chemicalGroup;
  final String chemicalDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chemicalName,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2,),
                Text(
                  chemicalGroup,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            height: MediaQuery.of(context).size.width * 0.15,
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
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
