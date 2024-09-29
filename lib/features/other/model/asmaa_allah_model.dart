class AsmaaAllahModel {
  final String ttl;
  final String dsc;

  AsmaaAllahModel({required this.ttl, required this.dsc});
  factory AsmaaAllahModel.fromJson(Map<String, dynamic> res) {
    return AsmaaAllahModel(
      ttl: res["ttl"],
      dsc: res["dsc"],
    );
  }
}
