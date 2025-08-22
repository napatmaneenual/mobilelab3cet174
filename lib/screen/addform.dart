import 'package:flutter/material.dart';
import 'package:mobilelab3No22cet174/models/house.dart';
import 'package:mobilelab3No22cet174/main.dart';  // import MyApp ถ้าจำเป็น

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _address = '';
  int _price = 0;
  HouseType _HouseType = HouseType.ttype1;

  // เพิ่มตัวแปร _foodpic สำหรับเก็บค่าที่เลือกใน dropdown
  Housepic _Housepic = Housepic.house1;

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
                      "ชื่อบ้าน",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาป้อนชื่อบ้าน';
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
                      "ที่อยู่",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาป้อนที่อยู่';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value!;
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
                DropdownButtonFormField<HouseType>(
                  value: _HouseType,
                  decoration: const InputDecoration(
                    label: Text(
                      "ชนิดบ้าน",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  items: HouseType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _HouseType = value!;
                    });
                  },
                  onSaved: (value) {
                    _HouseType = value!;
                  },
                ),
                const SizedBox(height: 20),

                // เพิ่ม DropdownButtonFormField สำหรับเลือกรูปภาพ
                DropdownButtonFormField<Housepic>(
                  value: _Housepic,
                  decoration: const InputDecoration(
                  label: Text(
                  "เลือกรูปภาพ",
                  style: TextStyle(fontSize: 20),
                )),
                items: Housepic.values.map((pic) {
                  return DropdownMenuItem(
                    value: pic,
                     child: Row(
                      children: [
                        Text(pic.namehouse),
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
                      _Housepic = value!;
                    });
                  },
                      onSaved: (value) {
                    _Housepic = value!;
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
                          emp.add(House(
                            name: _name,
                            type: _HouseType,
                            address: _address,
                            price: _price,
                            housepic: _Housepic,
                          ));

                          print("ชื่อบ้าน: $_name");
                          print("ที่อยู่: $_address");
                          print("ราคา: $_price");
                          print("ชนิดบ้าน: ${_HouseType.displayName}");
                          print("รูปภาพ: ${_Housepic.name}");

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
