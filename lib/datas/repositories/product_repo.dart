import 'dart:convert';

import 'package:test_app/datas/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String _apiurl = 'http://10.0.2.2:8000/api/products';

  Future getData() async {
    final response = await http.get(Uri.parse(_apiurl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // untuk nested json kita harus menjadikan list dari key json
      // yang akan kita tampilkan
      /* 
      Contoh :
      => json ini bervalue string
      "message": "Succes get data",
      => json ini bervalue number/int
      "status": 200, => contoh lain disini jika kita ingin mengambil data status code ini
                     => maka kita bisa ubah tipe data dari value yang ingin kita tampilkan contoh dibawah 
      => json bervalue List
      "product": [  ===>> // ini adalah key dari list json yang akan kita ambil dan tampilkan ke view
                {
                  "id": 2,
                  "name": "baju batik rancak",
                  "description": "Baju bagus nyaman dipakai",
                  "price": "1000009.00",
                  "imageUrl": "https://lzd-img-global.slatic.net/g/p/f447555206f20a3d28e3598150bd8f5c.jpg_720x720q80.jpg_.webp",
                  "createdAt": "2022-09-01 21:43:56",
                  "updatedAt": "2022-09-01 21:43:56"
                },
      }
      */

      // contoh lain
      // String list listData = jsonData['message']; => key dari message yang kita ambil dengan tipe data
      // => sesuai dengan value yang di ambil
      List<dynamic> listData = jsonData['product'];
      print(listData); // Untuk print data di console
      return listData;
    } else {
      throw Exception("failed to get data product");
    }
  }

  Future<Product> postProduct(
    String name,
    String description,
    String price,
    String imageUrl,
  ) async {
    // Map data = <String, dynamic>{
    //   'name': product!.name,
    //   'description': product.description,
    //   'price': product.price,
    //   'imageUrl': product.imageUrl,
    // };
    var response = await http.post(
      Uri.parse(_apiurl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8',
      },
      body: json.encode(<String, dynamic>{
        'name': name,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
      }),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed post product');
    }
  }
}
