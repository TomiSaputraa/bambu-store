import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/bloc/bloc_imports.dart';
import 'package:test_app/datas/models/product_model.dart';
import 'package:test_app/datas/repositories/product_repo.dart';
import 'package:test_app/presentations/widget_import.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    var _nameController = TextEditingController();
    var _desController = TextEditingController();
    var _priceController = TextEditingController();
    var _urlFotoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Tambah produk",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(top: 5),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  isThreeLine: true,
                  title: const Text("Nama produk *"),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan nama produk",
                        hintStyle: const TextStyle(fontSize: 15),
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          color: Colors.grey,
                          onPressed: () {
                            _nameController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 1,
              ),
              Card(
                margin: const EdgeInsets.all(0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  isThreeLine: true,
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: TextFormField(
                      controller: _desController,
                      keyboardType: TextInputType.multiline,
                      maxLength: 255,
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1000),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Deskripsi tidak boleh kosong";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan deskripsi produk",
                        hintStyle: const TextStyle(fontSize: 15),
                        counterText: '',
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          color: Colors.grey,
                          onPressed: () {
                            _desController.clear();
                          },
                          icon: const Icon(Icons.clear, size: 20),
                        ),
                      ),
                    ),
                  ),
                  title: const Text("Deskripsi produk *"),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 1,
              ),
              Card(
                margin: const EdgeInsets.all(0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  isThreeLine: true,
                  trailing: Text("Harga"),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      maxLines: null,
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        )
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Harga tidak boleh kosong";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan harga produk...",
                        hintStyle: TextStyle(fontSize: 15),
                        counter: Offstage(),
                      ),
                    ),
                  ),
                  title: const Text("Harga produk *"),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 1,
              ),
              Card(
                margin: const EdgeInsets.all(0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  isThreeLine: true,
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: TextFormField(
                      controller: _urlFotoController,
                      keyboardType: TextInputType.url,
                      maxLength: 1000,
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Foto Url tidak boleh kosong";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan link foto produk",
                        hintStyle: TextStyle(fontSize: 15),
                        counter: Offstage(
                          offstage: true,
                        ),
                      ),
                    ),
                  ),
                  title: const Text("Link foto produk *"),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  // ignore: deprecated_member_use
                  child: OutlineButton(
                    highlightedBorderColor: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Batal"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    child: const Text("Simpan"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
