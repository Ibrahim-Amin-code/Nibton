class WishListModel {
  bool? status;
  String? msg;
  List<Data>? data;

  WishListModel({this.status, this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['msg'] = this.msg;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  int? id;
  int? categoryId;
  int? shopId;
  // int? vendorId;
  String? name;
  String? description;
  int? price;
  int? quantity;
  String? modalNumber;
  String? department;
  String? coverImg;
  // String? slug;
  // int? status;
  // String? date;
  List<String>? size;
  List<String>? color;
  // String? createdAt;
  // Null? updatedAt;
  List<ProductImage>? productImage;

  Data(
      {this.id,
        this.categoryId,
        this.shopId,
        // this.vendorId,
        this.name,
        this.description,
        this.price,
        this.quantity,
        this.modalNumber,
        this.department,
        this.coverImg,
        // this.slug,
        // this.status,
        // this.date,
        this.size,
        this.color,
        // this.createdAt,
        // this.updatedAt,
        this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    shopId = json['shopId'];
    // vendorId = json['vendorId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    department = json['department'];
    coverImg = json['cover_img'];
    // slug = json['slug'];
    // status = json['status']/;
    // date = json['date'];
    size = json['size'].cast<String>();
    color = json['color'].cast<String>();
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['categoryId'] = this.categoryId;
  //   data['shopId'] = this.shopId;
  //   data['vendorId'] = this.vendorId;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['quantity'] = this.quantity;
  //   data['modal_number'] = this.modalNumber;
  //   data['department'] = this.department;
  //   data['cover_img'] = this.coverImg;
  //   data['slug'] = this.slug;
  //   data['status'] = this.status;
  //   data['date'] = this.date;
  //   data['size'] = this.size;
  //   data['color'] = this.color;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.productImage != null) {
  //     data['product_image'] =
  //         this.productImage!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  // Null? createdAt;
  // Null? updatedAt;

  ProductImage(
      {this.id, this.productId, this.image,});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['productId'] = this.productId;
  //   data['image'] = this.image;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}