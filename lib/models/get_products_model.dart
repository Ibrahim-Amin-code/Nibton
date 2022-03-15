class GetProductsModel {
  bool? status;
  String? msg;
  List<Data>? data;

  GetProductsModel({this.status, this.msg, this.data});

  GetProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? categoryId;
  String? shopId;
  Names? names;
  Names? descriptions;
  String? price;
  String? quantity;
  String? modalNumber;
  // Null? department;
  String? coverImg;
  Names? slug;
  String? status;
  // Null? date;
  List<String>? size;
  dynamic color;
  // String? createdAt;
  // String? updatedAt;
  String? name;
  String? description;
  List<ProductImage>? productImage;

  Data(
      {this.id,
      this.categoryId,
      this.shopId,
      this.names,
      this.descriptions,
      this.price,
      this.quantity,
      this.modalNumber,
      // this.department,
      this.coverImg,
      this.slug,
      this.status,
      // this.date,
      this.size,
      this.color,
      // this.createdAt,
      // this.updatedAt,
      this.name,
      this.description,
      this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    shopId = json['shopId'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    descriptions = json['descriptions'] != null
        ? new Names.fromJson(json['descriptions'])
        : null;
    price = json['price'];
    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    // department = json['department'];
    coverImg = json['cover_img'];
    slug = json['slug'] != null ? new Names.fromJson(json['slug']) : null;
    status = json['status'];
    // date = json['date'];
    size = json['size'].cast<String>();
    color = json['color'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }
}

class Names {
  String? ar;
  String? en;

  Names({this.ar, this.en});

  Names.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }
}

class ProductImage {
  int? id;
  String? productId;
  String? image;

  ProductImage({
    this.id,
    this.productId,
    this.image,
  });

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }
}
