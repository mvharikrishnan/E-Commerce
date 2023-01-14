import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:ecommerceapp/model/eventModel/eventModel.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';
import 'package:ecommerceapp/model/roleModels/roleModels.dart';


//Products Session
Stream<List<ProductModel>> FetchProducts({required String CollectionName}) =>
    FirebaseFirestore.instance.collection(CollectionName).snapshots().map(
        (snapShot) => snapShot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());

//Category Session
Stream<List<categoryModel>> fetchCategory({required String categoryName}) =>
    FirebaseFirestore.instance.collection(categoryName).snapshots().map(
        (snapshots) => snapshots.docs
            .map((doc) => categoryModel.fromJson(doc.data()))
            .toList());

//Event Session
Stream<List<eventModel>> fetchEvents() => FirebaseFirestore.instance
    .collection("Events")
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => eventModel.fromJson(doc.data())).toList());

//Cart Session
Stream<List<ProductModel>> fetchCartProducts(String userEmail) =>
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userEmail)
        .collection('Carts')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());

//WishList Session
Stream<List<ProductModel>> fetchWishListProducts(String UserEmail) =>
    FirebaseFirestore.instance
        .collection('Users')
        .doc(UserEmail)
        .collection('WishList')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());

//Address Session
Stream<List<AddressModel>> fetchUserAddress(String UserEmail) =>
    FirebaseFirestore.instance
        .collection('Users')
        .doc(UserEmail)
        .collection('Address')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());

//order session on user Side
Stream<List<OrderModel>> fetchUserOrder(String creatorEmail) => FirebaseFirestore
    .instance
    .collection('Users')
    .doc(creatorEmail)
    .collection('Orders')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => OrderModel.fromJSON(doc.data())).toList());

//order session on user Side
Stream<List<OrderModel>> fetchUserOrderOnCreator(String creatorEmail) => FirebaseFirestore
    .instance
    .collection('creatorEmail')
    .doc(creatorEmail)
    .collection('recivedOrders')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => OrderModel.fromJSON(doc.data())).toList());

//product displaying on creator side
Stream<List<ProductModel>> fetchCreatorsProducts(String creatorEmail) => FirebaseFirestore
    .instance
    .collection('creatorEmail')
    .doc(creatorEmail)
    .collection('creatorProducts')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList());

//CreatorEmail session
Stream<List<creatorModel>> fetchCreatorEmails() => FirebaseFirestore.instance
    .collection('creatorEmail')
    .snapshots()
    .map((snapShot) =>
        snapShot.docs.map((doc) => creatorModel.fromJson(doc.data())).toList());

//userEmail session
// Stream<userModel> fetchUserEmails() => FirebaseFirestore.instance
//     .collection('UserEmail')
//     .snapshots()
//     .map((snapShot) =>
//         snapShot.docs.map((doc) => userModel.fromJson(doc.data())).toList());
