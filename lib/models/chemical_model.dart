class ChemicalModel {
  final String chemicalId;
  final String chemicalIngredients;
  final String chemicalSearchTerm;
  final String chemicalName;
  final String chemicalGroup;
  final String chemicalHighlyToxic;
  final String chemicalToxic;
  final String chemicalPrecaution;
  final String chemicalResidual;
  final String chemicalApplicators;
  final String chemicalColor;

  ChemicalModel({required this.chemicalId,
    required this.chemicalIngredients,
    required this.chemicalSearchTerm,
    required this.chemicalName,
    required this.chemicalGroup,
    required this.chemicalHighlyToxic,
    required this.chemicalToxic,
    required this.chemicalPrecaution,
    required this.chemicalResidual,
    required this.chemicalApplicators,
    required this.chemicalColor
  });

  factory ChemicalModel.fromJson(Map<String, dynamic> json) {
    return ChemicalModel(
      chemicalId: json['id'],
      chemicalIngredients: json['activeingredient'],
      chemicalSearchTerm: json['searchterms'],
      chemicalName: json['productname'],
      chemicalGroup: json['chemicalgroup'],
      chemicalHighlyToxic: json['highlytoxic'],
      chemicalToxic: json['toxic'],
      chemicalPrecaution: json['noprecaution'],
      chemicalResidual: json['residualtoxicity'],
      chemicalApplicators: json['applicators'],
      chemicalColor: json['colorcode'],
    );
  }
}