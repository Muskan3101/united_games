import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 1;
  bool _isCupSelected = false;
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IceCreamOrder",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Icecream Order",
            style: TextStyle(fontSize: 24, color: Colors.black45),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value as int;
                      _isCupSelected = true;
                    });
                  }),
              const Text("Cup"),
              Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value as int;
                    });
                  }),
              const Text("Cone"),
            ],
          ),
          Image.asset("images/icecream.jpg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Quantity:",
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
              IconButton(onPressed: (){
                setState(() {
                  _quantity++;
                });
              }, icon: const Icon(Icons.arrow_drop_up)),
              Text("$_quantity"),
              IconButton(onPressed: (){
                setState(() {
                  _quantity--;
                });
              }, icon: const Icon(Icons.arrow_drop_down))
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              totalAmount();
            },
            child: Container(
              height: 40,
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: const Center(
                  child: Text(
                "CALCULATE COST",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text("$totalAmount()")
              ],
            ),
          )
        ],
      ),
    );
  }
  totalAmount(){
    if(_isCupSelected = true){
      return 3.49 * _quantity;
    }else{
      return 3.99 * _quantity;
    }
  }
}

