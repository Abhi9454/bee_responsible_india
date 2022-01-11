import '../../models/chemical_model.dart';
import 'package:flutter/material.dart';

import '../../config.dart';

class DetailsPageWidget extends StatelessWidget {
  const DetailsPageWidget({required this.chemicalDetails,Key? key}) : super(key: key);

  final ChemicalModel chemicalDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Pesticide Details'),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chemicalDetails.chemicalIngredients,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Alternate Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10,),
              Text(chemicalDetails.chemicalSearchTerm,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 25
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Common Product Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10,),
              Text(chemicalDetails.chemicalName,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Chemical Group',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10,),
              Text(chemicalDetails.chemicalGroup,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Residual Toxicity',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10,),
              Text(chemicalDetails.chemicalResidual,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Residual Toxicity',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10,),
              Text(chemicalDetails.chemicalToxic,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Applicator Warning',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10,),
              Text(chemicalDetails.chemicalApplicators,
                textAlign: TextAlign.left,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 8,),
              const Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
