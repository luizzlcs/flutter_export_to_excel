import 'package:flutter_export_to_excel/mock.dart';
import 'package:flutter_export_to_excel/vendas_model.dart';
import 'package:intl/intl.dart';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dados1 = dadosMockados;
  DateTime data = DateTime.now();

  pegandoDados() {
    List<VendasModel> listVendas = [];
    for (var item in dados1) {
      var dadosTransformados = item.split('|');

      var vm = VendasModel(
        data: dadosTransformados[0],
        servico: dadosTransformados[1],
        quantidade: int.parse(dadosTransformados[2]),
        precoUn: dadosTransformados[3],
        precoTotal: double.parse(dadosTransformados[4]),
        farma: dadosTransformados[5],
        kelly: dadosTransformados[6],
        jose: dadosTransformados[7],
        paula: dadosTransformados[8],
        rafaela: dadosTransformados[9],
        totalQtd: dadosTransformados[2],
      );
      listVendas.add(vm);
      print('DOUBLE PREÇO TOTAL -> ${vm.precoTotal}');
    }

    return listVendas;
  }

  void header(Excel excel) {
    List<String> lista = [
      'PERÍODO',
      'SERVIÇO',
      'QUANTIDADE',
      'PREÇO UN',
      'PREÇO TOTAL',
      'FARMA',
      'PEDRO',
      'ROBSON',
      'BRUNO',
      'THALES'
    ];
    final Sheet sheet = excel[excel.getDefaultSheet()!];
    for (var element in lista) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: lista.indexOf(element), rowIndex: 0))
          .value = element;
    }
  }

  void body(Excel excel) {
    var lista = pegandoDados();

    final Sheet sheet = excel[excel.getDefaultSheet()!];
    for (var element in lista) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 0, rowIndex: lista.indexOf(element) + 1))
          .value = element.data;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 1, rowIndex: lista.indexOf(element) + 1))
          .value = element.servico;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 2, rowIndex: lista.indexOf(element) + 1))
          .value = element.quantidade;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 3, rowIndex: lista.indexOf(element) + 1))
          .value = element.precoUn;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 4, rowIndex: lista.indexOf(element) + 1))
          .value = element.precoTotal;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 5, rowIndex: lista.indexOf(element) + 1))
          .value = element.farma;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 6, rowIndex: lista.indexOf(element) + 1))
          .value = element.kelly;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 7, rowIndex: lista.indexOf(element) + 1))
          .value = element.jose;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 8, rowIndex: lista.indexOf(element) + 1))
          .value = element.paula;
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: 9, rowIndex: lista.indexOf(element) + 1))
          .value = element.rafaela;
    }
  }

  void exportToExcel() {
    final excel = Excel.createExcel();
    header(excel);
    body(excel);

    excel.save(
        fileName: '${DateFormat("dd-MM-yyy hh:mm:ss").format(data)}.xlsx');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Exportando dados',
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: ElevatedButton.icon(
              icon: Icon(Icons.file_download),
              label: Text('Exportar'),
              onPressed: exportToExcel,
            ),
          ),
        ],
      ),
    );
  }
}
