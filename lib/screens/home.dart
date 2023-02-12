import 'package:flutter/material.dart';
import 'package:mobile_app/constrants/colors.dart';
import 'package:mobile_app/customCard/customCard.dart';

final _formKey = GlobalKey<FormState>();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController toDoController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  List<String> myList = [];
  List<String> myFilteredList = [];

  @override
  Widget build(BuildContext context) {
    // print(searchController.text);
    void searchFn() {
      setState(() {
        myFilteredList = myList.where((element) {
          return element
              .toLowerCase()
              .contains(searchController.text.toLowerCase());
        }).toList();
      });
    }

    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
          backgroundColor: tdBGColor,
          // elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color: tdBlack,
                size: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/avatar.jpg'),
                ),
              )
            ],
          )),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.white,
                  child: TextFormField(
                    cursorColor: tdBlack,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Search",
                    ),
                    controller: searchController,
                    onChanged: (value) {
                      searchFn();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "All ToDos",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: SingleChildScrollView(
                  child: Column(children: [
                    CustomCard(hasDeleteIcon: false, myChildren: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: TextFormField(
                                    cursorColor: tdBlack,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: 'Add a to do item',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a to do item';
                                      }
                                      return null;
                                    },
                                    controller: toDoController,
                                  )),
                              IconButton(
                                  onPressed: ((() {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        // myList.add(myText);
                                        myList = [
                                          toDoController.text,
                                          ...myList
                                        ];
                                      });
                                      toDoController.text = '';
                                    }
                                    // String myText = toDoController.text;
                                  })),
                                  icon: const Icon(Icons.add))
                            ],
                          ),
                        ],
                      )
                    ]),
                    ...(searchController.text.isEmpty ? myList : myFilteredList)
                        .map((e) => CustomCard(
                                onDeletePressed: () {
                                  // print('index  ${myList.indexOf(e)}');
                                  setState(() {
                                    myList.removeAt(myList.indexOf(e));
                                    // re-search process
                                    searchFn();
                                  });
                                },
                                myChildren: [
                                  Text(e),
                                ]))
                        .toList(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
