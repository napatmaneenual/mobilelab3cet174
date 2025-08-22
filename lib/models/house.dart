import 'package:flutter/material.dart';

/// ประกาศ enum สำหรับชนิดของอาหาร
enum HouseType {
  ttype1,
  ttype2,
  ttype3,
  ttype4,
  ttype5,
}

/// extension เพื่อให้แสดงชื่อชนิดอาหารสวย ๆ
extension HouseTypeExtension on HouseType {
  String get displayName {
    switch (this) {
      case HouseType.ttype1:
        return 'บ้านเดี่ยว';
      case HouseType.ttype2:
        return 'บ้านแฝด';
      case HouseType.ttype3:
        return 'ทาวน์เฮาส์';
      case HouseType.ttype4:
        return 'บ้านแถว';
      case HouseType.ttype5:
        return 'คอนโดมิเนียม';
    }
  }
}

/// สำหรับรูปภาพอาหาร
enum Housepic {
  house1(namehouse: "บ้านเดี่ยว", image: "assets/images/1.png"),
  house2(namehouse: "บ้านแฝด", image: "assets/images/2.png"),
  house3(namehouse: "ทาวน์เฮาส์", image: "assets/images/3.png"),
  house4(namehouse: "บ้านแถว", image: "assets/images/4.png"),
  house5(namehouse: "คอนโดมิเนียม", image: "assets/images/5.png");


  const Housepic({required this.image, required this.namehouse});
  final String image;
  final String namehouse;
}

/// คลาสข้อมูลเมนูอาหาร
class House {
  House({
    required this.name,
    required this.type,
    required this.address,
    required this.price,
    required this.housepic,
  });

  String name;
  HouseType type; // เปลี่ยนจาก String -> FoodType
  String address;
  int price;
  Housepic housepic;
}

/// รายการอาหารทั้งหมด
List<House> emp = [
  House(
    name: "บ้านเดี่ยว",
    type: HouseType.ttype1,
    address: "หมู่บ้านนาย ก",
    price: 1000000,
    housepic: Housepic.house1,
  ),
  House(
    name: "บ้านแฝด",
    type: HouseType.ttype2,
    address: "ถ คนจน",
    price: 3000000,
    housepic: Housepic.house2,
  ),
  House(
    name: "ทาวน์เฮาส์",
    type: HouseType.ttype3,
    address: "อ คนรวย",
    price: 1500000,
    housepic: Housepic.house3,
  ),
  House(
    name: "บ้านแถว",
    type: HouseType.ttype4,
    address: "หมู่บ้านลุงพล",
    price: 500000,
    housepic: Housepic.house4,
  ),
  House(
    name: "คอนโดมิเนียม",
    type: HouseType.ttype5,
    address: "ชุมชนคนมีเงิน",
    price: 2000000,
    housepic: Housepic.house5,
  ),
];