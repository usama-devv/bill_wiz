import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart'; 

@HiveType(typeId: 0)
// ignore: must_be_immutable
class ProductModel extends Product {
  
  @HiveField(0)
  @override
  String get id => super.id;

  @HiveField(1)
  @override
  String get name => super.name;

  @HiveField(2)
  @override
  String get barcode => super.barcode;

  @HiveField(3)
  @override
  double get price => super.price;

  @HiveField(4)
  @override
  int get stock => super.stock;

  const ProductModel({
    required super.id,
    required super.name,
    required super.barcode,
    required super.price,
    super.stock = 0,
  });

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      barcode: product.barcode,
      price: product.price,
      stock: product.stock,
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      barcode: barcode,
      price: price,
      stock: stock,
    );
  }
}