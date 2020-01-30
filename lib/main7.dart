//一覧画面
import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

class Main7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                label: Text('FROM'),
              ),
              DataColumn(
                label: Text('TO'),
              ),
              DataColumn(
                label: Text('日付'),
              ),
              DataColumn(
                label: Text('内容'),
              ),
            ],
            rows: items
                .map(
                  (itemRow) => DataRow(
                    cells: [
                      DataCell(
                        Text(itemRow.itemFrom),
                      ),
                      DataCell(
                        Text(itemRow.itemTo),
                      ),
                      DataCell(
                        Text(itemRow.itemDay),
                      ),
                      DataCell(
                        Text(itemRow.itemNaiyo),
//                        showEditIcon: false,
//                        placeholder: false,
//                        onTap: null,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ItemInfo {
  String itemFrom;
  String itemDay;
  String itemNaiyo;
  String itemTo;

  ItemInfo({
    this.itemFrom,
    this.itemDay,
    this.itemNaiyo,
    this.itemTo,
  });
}

var items = <ItemInfo>[
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/01',
    itemNaiyo: 'これしてくれてありがとう。',
    itemTo: 'Bさん、Cさん',
  ),
  ItemInfo(
    itemFrom: 'BBさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お酒ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
  ItemInfo(
    itemFrom: 'Aさん',
    itemDay: '2020/01/12',
    itemNaiyo: 'お茶ありがとう。',
    itemTo: 'Bさん、Cさん、Dさん、Eさん',
  ),
];
