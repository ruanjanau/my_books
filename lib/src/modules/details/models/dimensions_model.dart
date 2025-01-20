class DimensionsModel {
  final String? height;
  final String? width;
  final String? thickness;

  const DimensionsModel({
    this.height,
    this.width,
    this.thickness,
  });

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      height: json['height'] ?? '',
      width: json['width'] ?? '',
      thickness: json['thickness'] ?? '',
    );
  }
}
