import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/constrants/colors.dart';
import 'package:mobile_app/screens/cubit/home_cubit.dart';

import '../customCard/customCard3.dart';

// final _formKey = GlobalKey<FormState>();

class Home3 extends StatefulWidget {
  const Home3({Key? key}) : super(key: key);

  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return GestureDetector(
                    onTap: () {
                      print(state.counter);
                      context.read<HomeCubit>().incrementCount();
                    },
                    child: Text('counter = ${state.counter}'));
              },
            ),
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
                    CustomCard3(
                        hasDeleteIcon: false,
                        myChild: Column(
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
                                    )),
                                IconButton(
                                    onPressed: (() {}),
                                    icon: const Icon(Icons.add))
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
