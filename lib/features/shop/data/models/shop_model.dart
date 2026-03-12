import 'package:hive/hive.dart';
import '../../domain/entities/shop.dart';

part 'shop_model.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class ShopModel extends Shop {
  
  @HiveField(0)
  @override
  String get name => super.name;

  @HiveField(1)
  @override
  String get addressLine1 => super.addressLine1;

  @HiveField(2)
  @override
  String get addressLine2 => super.addressLine2;

  @HiveField(3)
  @override
  String get phoneNumber => super.phoneNumber;

  @HiveField(4)
  @override
  String get upiId => super.upiId;

  @HiveField(5)
  @override
  String get footerText => super.footerText;

  const ShopModel({
    required super.name,
    required super.addressLine1,
    required super.addressLine2,
    required super.phoneNumber,
    required super.upiId,
    required super.footerText,
  });

  factory ShopModel.fromEntity(Shop shop) {
    return ShopModel(
      name: shop.name,
      addressLine1: shop.addressLine1,
      addressLine2: shop.addressLine2,
      phoneNumber: shop.phoneNumber,
      upiId: shop.upiId,
      footerText: shop.footerText,
    );
  }

  Shop toEntity() => this;
}