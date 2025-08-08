import 'package:flutter/material.dart';
import 'package:mobilelab3cet174/models/foodmenu.dart';
import 'package:mobilelab3cet174/main.dart';  // import MyApp ถ้าจำเป็น

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _component = '';
  int _price = 0;
  FoodType _foodType = FoodType.ttype1;

  // เพิ่มตัวแปร _foodpic สำหรับเก็บค่าที่เลือกใน dropdown
  Foodpic _foodpic = Foodpic.menu1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูล"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    label: Text(
                      "ชื่ออาหาร",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาป้อนชื่ออาหาร';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  maxLength: 100,
                  decoration: const InputDecoration(
                    label: Text(
                      "ส่วนประกอบสำคัญ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาป้อนส่วนประกอบสำคัญ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _component = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      "ราคา",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาป้อนราคา';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'กรุณากรอกราคาเป็นตัวเลขมากกว่า 0';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _price = int.tryParse(value ?? '0') ?? 0;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<FoodType>(
                  value: _foodType,
                  decoration: const InputDecoration(
                    label: Text(
                      "ชนิดอาหาร",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  items: FoodType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodType = value!;
                    });
                  },
                  onSaved: (value) {
                    _foodType = value!;
                  },
                ),
                const SizedBox(height: 20),

                // เพิ่ม DropdownButtonFormField สำหรับเลือกรูปภาพ
                DropdownButtonFormField<Foodpic>(
                  value: _foodpic,
                  decoration: const InputDecoration(
                  label: Text(
                  "เลือกรูปภาพ",
                  style: TextStyle(fontSize: 20),
                )),
                items: Foodpic.values.map((pic) {
                  return DropdownMenuItem(
                    value: pic,
                     child: Row(
                      children: [
                        Text(pic.namefood),
                        const SizedBox(width: 10),
                        Image.asset(
                          pic.image,
                          width: 30,
                          height: 30,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                    onChanged: (value) {
                      setState(() {
                      _foodpic = value!;
                    });
                  },
                      onSaved: (value) {
                    _foodpic = value!;
                  },
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // เพิ่มข้อมูลใหม่เข้าใน list emp
                          emp.add(Foodmenu(
                            name: _name,
                            type: _foodType,
                            component: _component,
                            price: _price,
                            foodpic: _foodpic,
                            color: Colors.orange,
                          ));

                          print("ชื่ออาหาร: $_name");
                          print("ส่วนประกอบ: $_component");
                          print("ราคา: $_price");
                          print("ชนิดอาหาร: ${_foodType.displayName}");
                          print("รูปภาพ: ${_foodpic.name}");

                          _formKey.currentState!.reset();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyApp(),
                            ),
                          );
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "บันทึก",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
