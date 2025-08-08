import 'package:flutter/material.dart';

/// ประกาศ enum สำหรับชนิดของอาหาร
enum FoodType {
  ttype1,
  ttype2,
  ttype3,
  fastfood,
  healthy,
}

/// extension เพื่อให้แสดงชื่อชนิดอาหารสวย ๆ
extension FoodTypeExtension on FoodType {
  String get displayName {
    switch (this) {
      case FoodType.ttype1:
        return 'ต้ม';
      case FoodType.ttype2:
        return 'ย่าง';
      case FoodType.ttype3:
        return 'ทอด';
      case FoodType.fastfood:
        return 'ฟาสต์ฟู้ด';
      case FoodType.healthy:
        return 'สุขภาพ';
    }
  }
}

/// สำหรับรูปภาพอาหาร
enum Foodpic {
  menu1(namefood: "สุกี้", image: "assets/images/1.png"),
  menu2(namefood: "สลัดรวม", image: "assets/images/2.png"),
  menu3(namefood: "สเต็กหมู", image: "assets/images/3.png"),
  menu4(namefood: "สเต็กเนื้อ", image: "assets/images/4.png"),
  menu5(namefood: "แฮมเบอร์เกอร์", image: "assets/images/5.png"),
  menu6(namefood: "พิซซ่า", image: "assets/images/6.png"),
  menu7(namefood: "ก๋วยเตี๋ยว", image: "assets/images/7.png");

  const Foodpic({required this.image, required this.namefood});
  final String image;
  final String namefood;
}

/// คลาสข้อมูลเมนูอาหาร
class Foodmenu {
  Foodmenu({
    required this.name,
    required this.type,
    required this.component,
    required this.price,
    required this.foodpic,
    required this.color,
  });

  String name;
  FoodType type; // เปลี่ยนจาก String -> FoodType
  String component;
  int price;
  Foodpic foodpic;
  Color color;
}

/// รายการอาหารทั้งหมด
List<Foodmenu> emp = [
  Foodmenu(
    name: "สุกี้ผักรวม",
    type: FoodType.ttype1,
    component: "ไข่ไก่,เกี้ยวกุ้ง,ปูอัด,เบค่อน,ผักสด",
    price: 299,
    foodpic: Foodpic.menu1,
    color: Colors.green,
  ),
  Foodmenu(
    name: "สลัดผัก",
    type: FoodType.healthy,
    component: "แครอท,มะเขือเทศ,ผักรวม",
    price: 159,
    foodpic: Foodpic.menu2,
    color: Colors.yellow,
  ),
  Foodmenu(
    name: "สเต็กเนื้อ",
    type: FoodType.ttype2,
    component: "เนื้อวากิว,ผักกาด,มะเขือเทศ,แครอท",
    price: 1200,
    foodpic: Foodpic.menu3,
    color: Colors.orange,
  ),
  Foodmenu(
    name: "สเต็กไก่",
    type: FoodType.ttype2,
    component: "เนื้อไก่,เฟร้นฟราย,มะเขือเทศ,ไข่ไก่",
    price: 500,
    foodpic: Foodpic.menu4,
    color: Colors.blueGrey,
  ),
  Foodmenu(
    name: "แฮมเบอเก้อ",
    type: FoodType.fastfood,
    component: "ไข่ไก่,เนื้อ,ชีส,เบค่อน,ผักสด,ขนมปัง",
    price: 150,
    foodpic: Foodpic.menu5,
    color: Colors.blueAccent,
  ),
  Foodmenu(
    name: "พิซซ่า",
    type: FoodType.fastfood,
    component: "แป้ง,ซอสพิซซ่า,มะเขือเทศ,แฮม,ชีส,สัปปะรด",
    price: 199,
    foodpic: Foodpic.menu6,
    color: Colors.limeAccent,
  ),
  Foodmenu(
    name: "บะหมี่",
    type: FoodType.ttype1,
    component: "ไข่ไก่,เนื้อ,ผักสด,เส้นบะหมี่",
    price: 80,
    foodpic: Foodpic.menu7,
    color: Colors.green,
  ),
];
