import 'package:flutter/material.dart';
import 'package:test_app/bloc/bloc_imports.dart';
import 'package:test_app/datas/repositories/product_repo.dart';
import 'package:test_app/presentations/pages/pages/add_products_page.dart';
import 'package:test_app/presentations/pages/pages/details_page.dart';
import 'package:test_app/presentations/widget_import.dart';
import 'package:test_app/datas/repositories/product_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Bambu Store",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.black,
            splashRadius: 20,
            tooltip: 'Add products',
            icon: const Icon(
              Icons.add_outlined,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddProducts()),
              );
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                splashRadius: 20,
                tooltip: 'Your shop bag',
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
              Positioned(
                right: 5,
                top: 12,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      "20",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(
          RepositoryProvider.of<ProductRepository>(context),
        )..add(LoadProductEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitialState) {
              return const LinearProgres();
            } else if (state is ProductLoadedState) {
              return RefreshIndicator(
                color: Colors.black,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 1500));
                  context.read<ProductBloc>().add(LoadProductEvent());
                },
                child: Padding(
                  padding: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? const EdgeInsets.symmetric(horizontal: 22)
                      : const EdgeInsets.all(5.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                product: state.products[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 160,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 178,
                                width: MediaQuery.of(context).size.width,
                                child: Image(
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    state.products[index]['imageUrl'],
                                  ),
                                ),
                              ),
                              Container(
                                height: 48.0,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  state.products[index]['name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                height: 26,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  state.products[index]['price'],
                                  style: TextStyle(
                                    color: Colors.red[400],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                height: 20,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                    Text(
                                      "Kab. Merangin",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is ProductFailedState) {
              return const LoadError();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
