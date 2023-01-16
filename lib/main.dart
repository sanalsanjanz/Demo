import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> values = List.empty(growable: true);

  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: valueController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String val = valueController.text;
                      if (val.isNotEmpty) {
                        setState(() {
                          values.add(valueController.text);
                        });
                        valueController.clear();
                      }
                    },
                    icon: const Icon(Icons.done),
                  )
                ],
              ),
              values.isEmpty
                  ? const Center(child: Text('nothing found'))
                  : Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          key: Key(values.length.toString()),
                          itemCount: values.length,
                          itemBuilder: (context, index) {
                            return getRow(index: index);
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  getRow({required int index}) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            enabled: false,
            initialValue: values[index],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              values.removeAt(index);
            });
          },
          child: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController valueController = TextEditingController();
  List<TextEditingController> controller = [];
  @override
  void initState() {
    super.initState();
    controller.isEmpty ? additem() : () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: controller.length,
      itemBuilder: (context, index) {
        return getTextField(initialval: controller[index].text, id: index);
      },
    )); 
  }

  void additem() {
    final TextEditingController item = TextEditingController();
    controller.add(item);
    setState(() {});
  }

  getTextField({var id, String? initialval}) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: initialval,
            enabled: initialval == '' ? true : false,
            // controller: valueController,
          ),
        ),
        IconButton(
            onPressed: initialval != '' ? removeitem(id: id) : additem,
            icon: Icon(initialval == '' ? Icons.add : Icons.remove))
      ],
    );
  }

  removeitem({var id}) {
    controller.remove(id);
  }
}
 */