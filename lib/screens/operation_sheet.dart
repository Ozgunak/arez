import 'package:flutter/material.dart';

import '../models/operation_model.dart';

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
    int totalOperations = operations.where((op) => op.selected).length;
    Duration totalTime = totalOperations > 0
        ? operations
            .where((op) => op.selected)
            .map((op) => op.time)
            .reduce((value, element) => value + element)
        : Duration.zero;
    double totalPrice = totalOperations > 0
        ? operations
            .where((op) => op.selected)
            .map((op) => op.price)
            .reduce((value, element) => value + element)
        : 0.0;

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: 'Total Operations: ',
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                    text: '$totalOperations\n',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Total Time: ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: '${totalTime.inMinutes} min\n',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Total Price: ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: '$totalPrice CAD',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Confirm'),
            onPressed: totalOperations > 0
                ? () {
                    // Implement your action on confirm button press
                  }
                : null,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: operations.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text: '${operations[index].name} ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${operations[index].time.inMinutes} min ',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          TextSpan(
                            text: '${operations[index].price} CAD',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    trailing: operations[index].selected
                        ? Icon(Icons.check_box, color: Colors.green)
                        : Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      setState(() {
                        operations[index].selected =
                            !operations[index].selected;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
