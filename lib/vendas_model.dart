class VendasModel {
  String data;
  String servico;
  int quantidade;
  String precoUn;
  double precoTotal;
  String? farma;
  String? kelly;
  String? jose;
  String? paula;
  String? rafaela;
  String? totalQtd;

  VendasModel({
    required this.data,
    required this.servico,
    required this.quantidade,
    required this.precoUn,
    required this.precoTotal,
    this.farma,
    this.kelly,
    this.jose,
    this.paula,
    this.rafaela,
    this.totalQtd,
  });

  @override
  String toString() {
    return 'VendasModel(data: $data, servico: $servico, quantidade: $quantidade, precoUn: $precoUn, precoTotal: $precoTotal, farma: $farma, kelly: $kelly, jose: $jose, paula: $paula, rafaela: $rafaela)';
  }
}
