abstract class VegetablesProvider {
  Future loadAllVegetables() async {}

  Future addVegetable({
    required String vegetableName,
    required String units,
    required String price,
  }) async {}

  Future loadUserVegetables() async {}
}
