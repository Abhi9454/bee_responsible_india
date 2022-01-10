import 'package:flutter/material.dart';

class HomePageListContainer extends StatelessWidget {
  const HomePageListContainer(
      {required this.colorCode, required this.chemicalName,required this.chemicalDescription, Key? key})
      : super(key: key);

  final int colorCode;
  final String chemicalName;
  final String chemicalDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorCode == 1
          ? Colors.white
          : colorCode == 2
              ? Colors.redAccent
              : colorCode == 3
                  ? Colors.yellowAccent
                  : Colors.lightGreenAccent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chemicalName,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            Text(
              chemicalDescription,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 6,),
            const Divider(
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
