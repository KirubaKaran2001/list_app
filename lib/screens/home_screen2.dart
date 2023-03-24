// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<Map<String, dynamic>> items = [];
  bool _aValue = false;
  bool _bValue = false;
  bool _cValue = false;
  bool _dValue = false;
  bool _eValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'List App',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              items.add(<String, dynamic>{
                'choices': [],
              });
            });
            debugPrint(items.toString());
          },
          child: const Text(
            'Add',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Item Name',
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Item Number',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Item Price',
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Item Name',
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Item Number',
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButton(
                                onPressed: () {
                                  // _aValue = false;
                                  // _bValue = false;
                                  // _cValue = false;
                                  openDialogBox(context, items, index);
                                },
                                child: const Text(
                                  'Open Dialog',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    items.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (items[index]['choices'].isNotEmpty)
                          getChoices(items, index),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  openDialogBox(
      BuildContext context, List<Map<String, dynamic>> items, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _aValue,
                      onChanged: (value) {
                        setState(() {
                          _aValue = value!;
                          if (_aValue == true) {
                            items[index]['choices'].add('a');
                          } else {
                            items[index]['choices'].remove('a');
                          }
                        });
                      },
                    ),
                    const Text(
                      'a',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _bValue,
                      onChanged: (value) {
                        setState(() {
                          _bValue = value!;
                          if (_bValue == true) {
                            items[index]['choices'].add('b');
                          } else {
                            items[index]['choices'].remove('b');
                          }
                        });
                      },
                    ),
                    const Text('b'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _cValue,
                      onChanged: (value) {
                        setState(() {
                          _cValue = value!;
                          if (_cValue == true) {
                            items[index]['choices'].add('c');
                          } else {
                            items[index]['choices'].remove('c');
                          }
                        });
                      },
                    ),
                    const Text('c'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _dValue,
                      onChanged: (value) {
                        setState(() {
                          _dValue = value!;
                          if (_dValue == true) {
                            items[index]['choices'].add('d');
                          } else {
                            items[index]['choices'].remove('d');
                          }
                        });
                      },
                    ),
                    const Text('d'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _eValue,
                      onChanged: (value) {
                        setState(() {
                          _eValue = value!;
                          if (_eValue == true) {
                            items[index]['choices'].add('e');
                          } else {
                            items[index]['choices'].remove('e');
                          }
                        });
                      },
                    ),
                    const Text('e'),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  debugPrint(items.toString());
                },
                child: const Text(
                  'Save',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  getChoices(List<Map<String, dynamic>> items, int index) {
    String? choice;
    List<String> choicesList = [];
    for (var i = 0; i < items[index]['choices'].length; i++) {
      choice = items[index]['choices'][i];
      choicesList.add(choice!);
    }
    List<String> strarray = choicesList
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(" ");
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: (choicesList.length > 1)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: strarray.map(
                (word) {
                  return Text(
                    word.replaceAll(',', ''),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  );
                },
              ).toList(),
            )
          : Text(
              choicesList.toString().replaceAll('[', '').replaceAll(']', ''),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
    );
  }
}
