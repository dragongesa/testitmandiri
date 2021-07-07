// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/selection_controller.dart';

class SelectionView extends GetView<SelectionController> {
  const SelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2. Lihat Hasil'),
        centerTitle: true,
      ),
      body: GetBuilder<SelectionController>(
        id: 'table',
        init: controller,
        builder: (controller) {
          if (controller.parsedJson.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Table(
                  columnWidths: {
                    8: FixedColumnWidth(150)
                  },
                  defaultColumnWidth: const MaxColumnWidth(
                      FixedColumnWidth(100.0), FractionColumnWidth(0.1)),
                  children: [
                    TableRow(children: [
                      _TableItem("Kode 1"),
                      _TableItem("Kode 2"),
                      _TableItem("Name"),
                      _TableItem("Gender"),
                      _TableItem("Grade"),
                      _TableItem("Class"),
                      _TableItem("Old"),
                      _TableItem("NIK"),
                      _TableItem("Skill"),
                    ]),
                  ],
                ),
                Table(
                    defaultColumnWidth: IntrinsicColumnWidth(),
                    border: TableBorder.all(width: 1),
                    children: controller.parsedJson.map((e) {
                      var i = controller.parsedJson.indexOf(e);
                      return TableRow(children: [
                        Container(
                          constraints: BoxConstraints(minWidth: 100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(controller.parsedJson[i].first.id
                                .substring(0, 1)),
                          ),
                        ),
                        Table(

                          columnWidths: {
                            7: FixedColumnWidth(150)
                          },
                          defaultColumnWidth: const MaxColumnWidth(
                              FixedColumnWidth(100.0),
                              FractionColumnWidth(0.1)),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.symmetric(inside: BorderSide(width: 1)),
                          children: controller.parsedJson[i].map((el) {
                            return TableRow(
                                children: [
                              _TableItem(el.id.substring(2)),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.fill,
                                child: Container(
                                  // height: double.infinity,
                                    color: el.data.gender == "M"
                                        ? Colors.amber
                                        : Colors.orange,

                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: _TableItem(el.data.name))),
                              ),
                              _TableItem(
                                  el.data.gender == "M" ? "Male" : "Female"),
                              _TableItem(el.data.grade.toString()),
                              _TableItem(el.data.dataClass),
                              _TableItem(el.data.old.toString()),
                              _TableItem(el.data.nik.toString()),
                              _TableItem(el.data.skill
                                  .map((e) {
                                    var index = el.data.skill.indexOf(e);
                                    if (el.data.skill.length > 1) {
                                      if (el
                                          .data.skill[index] ==
                                          el.data
                                              .skill[el.data.skill.length - 1]) {
                                        return " dan " + e.name;
                                      } else {
                                        if (el.data.skill[index] !=
                                            el.data.skill.first) {
                                          return ", " + e.name;
                                        }
                                      }
                                    }
                                    return e.name;
                                  })
                                  .toList()
                                  .join()),
                            ]);
                          }).toList(),
                        )
                      ]);
                    }).toList()),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TableItem extends StatelessWidget {
  final String value;

  const _TableItem(this.value);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(value.toString()),
    );
  }
}
