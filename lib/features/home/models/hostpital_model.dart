class HospitalModel {
  final int id;
  final String nameHospital;
  final String addressHospital;
  final String category;
  final String image;
  final bool isFavorite;

  HospitalModel({
    required this.id,
    required this.nameHospital,
    required this.addressHospital,
    required this.category,
    required this.image,
    required this.isFavorite,
  });
}
