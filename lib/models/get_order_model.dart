class GetOrderModel {
  bool? status;
  String? msg;
  List<Data>? data;

  GetOrderModel({this.status, this.msg, this.data});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
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
  dynamic orderNumber;
  int? buyerId;
  dynamic vendorId;
  dynamic shopId;
  int? addressId;
  String? status;
  int? isPaid;
  String? paymentMethod;
  dynamic notes;
  dynamic billingFullname;
  dynamic billingAddress;
  dynamic billingCity;
  dynamic billingState;
  dynamic billingZipcode;
  dynamic billingPhone;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;

  Data(
      {this.id,
        this.orderNumber,
        this.buyerId,
        this.vendorId,
        this.shopId,
        this.addressId,
        this.status,
        this.isPaid,
        this.paymentMethod,
        this.notes,
        this.billingFullname,
        this.billingAddress,
        this.billingCity,
        this.billingState,
        this.billingZipcode,
        this.billingPhone,
        this.createdAt,
        this.updatedAt,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    buyerId = json['buyerId'];
    vendorId = json['vendorId'];
    shopId = json['shopId'];
    addressId = json['addressId'];
    status = json['status'];
    isPaid = json['is_paid'];
    paymentMethod = json['payment_method'];
    notes = json['notes'];
    billingFullname = json['billing_fullname'];
    billingAddress = json['billing_address'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingZipcode = json['billing_zipcode'];
    billingPhone = json['billing_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

}

class Products {
  int? id;
  int? orderId;
  int? vendorBuyerId;
  int? orderProductId;
  int? price;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
        this.orderId,
        this.vendorBuyerId,
        this.orderProductId,
        this.price,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    vendorBuyerId = json['vendor_buyer_id'];
    orderProductId = json['order_productId'];
    price = json['price'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}