
import 'package:flutter/material.dart';
import 'package:mobile_app/constrants/colors.dart';

import '../customCard/customCard2.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<String> myFilteredList = [];
  List<String> myList = ['Ruja', 'Maharjan', 'a'];
  TextEditingController addToDoController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: Column(
                  children: [
                    CustomCard2(
                      hasDeleteIcon: false,
                      myChildren: [
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
                                      controller: addToDoController,
                                      cursorColor: tdBlack,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'Add a to do item',
                                      ),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // myList.add(addToDoController.text);
                                        myList = [
                                          addToDoController.text,
                                          ...myList
                                        ];
                                        addToDoController.text = '';
                                      });
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    ...(searchController.text.isEmpty ? myList : myFilteredList)
                        .map((e) => CustomCard2(
                            onDeletePressed: () {
                              setState(() {
                                myList.remove(e);
                                searchFn();
                              });
                            },
                            myChildren: [Text(e)]))
                        .toList(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
