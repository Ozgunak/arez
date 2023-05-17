import 'package:flutter/material.dart';
import 'package:arez/models/operation_model.dart';

class OperationBottomSheet extends StatefulWidget {
  @override
  _OperationBottomSheetState createState() => _OperationBottomSheetState();
}

class _OperationBottomSheetState extends State<OperationBottomSheet> {
  final List<Operation> operations = [
    Operation(name: 'Operation 1', time: Duration(minutes: 30), price: 50),
    Operation(name: 'Operation 2', time: Duration(minutes: 60), price: 75),
    Operation(name: 'Operation 3', time: Duration(minutes: 45), price: 65),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemCount: operations.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                  '${operations[index].name} ${operations[index].time.inMinutes} min ${operations[index].price} CAD'),
              trailing: operations[index].selected
                  ? Icon(Icons.check_box, color: Colors.green)
                  : Icon(Icons.check_box_outline_blank),
              onTap: () {
                setState(() {
                  operations[index].selected = !operations[index].selected;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
