import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController directorController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(size.width * 0.1),
            child: Table(
              border: TableBorder.all(),
              children: <TableRow>[
                TableRow(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(hintText: 'Movie Name'),
                    ),
                    TextFormField(
                      controller: directorController,
                      decoration:
                          const InputDecoration(hintText: 'Director Name'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                      child: const Text('Add'),
                    )
                  ],
                ),
              ],
            ),
          ),
          isVisible ? result(size) : Container()
        ],
      ),
    );
  }

  Column result(Size size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.1),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(),
            children: <TableRow>[
              const TableRow(
                children: [
                  Text('Director'),
                  Text('Movie'),
                  Text(''),
                ],
              ),
              TableRow(
                children: [
                  Text(directorController.text),
                  Text(nameController.text),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isVisible = false;
                      });
                    },
                    child: const Text('Remove'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
