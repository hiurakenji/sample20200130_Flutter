import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarCommon extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CalendarCommon> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  var _labelText = (DateFormat('yyyy/MM/dd')).format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(_labelText),
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () => _selectDate(context),
                ),
                color: Colors.red,
              ),
            ),
          ],

//          <Widget>[
//            Text(_labelText),
//            IconButton(
//              icon: Icon(Icons.date_range),
//              onPressed: () => _selectDate(context),
//            )
//          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2200),
      locale: Localizations.localeOf(context),
    );

    if (selected != null) {
      setState(() {
        _labelText = (DateFormat('yyyy/MM/dd')).format(selected);
      });
    }
  }
}
