import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:isleg_ecommerce/blocs/category/category_bloc.dart';

import 'package:isleg_ecommerce/blocs/home/category_bloc/categery_selection_state.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/category_selection_bloc.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/category/components/category_side.dart';

class CategoryScreen extends StatefulWidget {
  final List categoryList;
  const CategoryScreen({
    required this.categoryList,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late PageController pageController;
  final CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    super.initState();
    _categoryBloc.add(
      CategoryInitialEvent(
        categoryList: List<bool>.filled(widget.categoryList.length, false),
      ),
    );
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _categoryBloc,
      child: Scaffold(
        appBar: CustomAppbar(
          number: 3,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySide(
              categoryList: widget.categoryList,
              pageController: pageController,
            ),
            Container(
              color: AppColors.lightGreyColor1,
              width: 0.5,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: pageController,
                child:
                    BlocBuilder<CategorySelectionBloc, CategorySelectionState>(
                  builder: (context, state) {
                    return ExpansionPanelList.radio(
                      expandedHeaderPadding: EdgeInsets.zero,
                      expansionCallback: (int index, bool isExpanded) {
                        final categoryList = state as CategoryInitialEvent;
                        context.read<CategoryBloc>().add(
                              CategoryExpandEvent(
                                isExpanded: isExpanded,
                                index: index,
                                categoryList: categoryList.categoryList,
                              ),
                            );
                      },
                      children: widget
                          .categoryList[state.stateIndex].childCategory
                          .map((e) {
                            if (e.childCategory.isNotEmpty) {
                              return ExpansionPanelRadio(
                                headerBuilder: (context, isExpanded) =>
                                    ListTile(
                                  title: Text(e.name.toString()),
                                  trailing: Icon(
                                    isExpanded
                                        ? IconlyLight.arrowUp2
                                        : IconlyLight.arrowDown2,
                                    size: 17,
                                  ),
                                ),
                                value: e,
                                body: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: e.childCategory.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 50,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 5,
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightGreyColor,
                                        borderRadius:
                                            AppBorderRadius().borderRadius15,
                                        border: Border.all(
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                      child: Text(
                                        e.childCategory[index].name.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                                canTapOnHeader: true,
                              );
                            } else {
                              return ExpansionPanelRadio(
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Text(e.name.toString()),
                                    trailing: const Icon(
                                      IconlyLight.arrowRight2,
                                      size: 17,
                                    ),
                                  );
                                },
                                value: e,
                                body: const SizedBox.shrink(),
                                canTapOnHeader: false,
                              );
                            }
                          })
                          .toList()
                          .cast<ExpansionPanel>(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _categoryBloc.close();
    pageController.dispose();
  }
}
