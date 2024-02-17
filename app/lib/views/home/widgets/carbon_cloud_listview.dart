import 'package:collection/collection.dart';
import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:flutter/material.dart';

class CarbonCloudListView extends StatefulWidget {
  CarbonCloudListView({
    super.key,
    required this.listKey,
    required List<CarbonCloudState> items,
    required this.itemCount,
    required this.onTapItem,
    required this.itemBuilder,
  }) : items = List<CarbonCloudState>.from(items);

  final GlobalKey<AnimatedListState> listKey;
  final List<CarbonCloudState> items;
  final int itemCount;
  final Function(CarbonCloudState) onTapItem;
  final Function(
    CarbonCloudState,
    Animation<double>,
    Function(CarbonCloudState)?,
  ) itemBuilder;

  @override
  State<CarbonCloudListView> createState() => _CarbonCloudListViewState();
}

class _CarbonCloudListViewState extends State<CarbonCloudListView> {
  late final GlobalKey<AnimatedListState> _listKey;
  late final Function(CarbonCloudState) _onTapItem;
  late final Function(
    CarbonCloudState,
    Animation<double>,
    Function(CarbonCloudState)?,
  ) _itemBuilder;

  late List<CarbonCloudState> _items;
  late int _itemCount;

  @override
  void initState() {
    super.initState();
    _listKey = widget.listKey;
    _onTapItem = widget.onTapItem;
    _itemBuilder = widget.itemBuilder;

    // widget.items를 깊은 복사 후 _items에 할당
    _items = List<CarbonCloudState>.from(widget.items);
    _itemCount = widget.itemCount;
  }

  @override
  void didUpdateWidget(covariant CarbonCloudListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      if (oldWidget.items.equals(widget.items)) {
        return;
      }

      _items = List<CarbonCloudState>.from(widget.items);
      _itemCount = widget.itemCount;
    });

    // widget의 items와 oldWidget의 items를 비교하여 widget의 items가 oldWidget의 items에 존재하지 않으면
    // insertItems에 추가하고, oldWidget의 items가 widget의 items에 존재하지 않으면 deleteItems에 추가한다.
    List<int> removeIndices = [];
    List<CarbonCloudState> removeItems = [];
    List<int> insertIndices = [];
    List<CarbonCloudState> insertItems = [];

    for (int i = 0; i < oldWidget.itemCount; i++) {
      if (!widget.items
          .sublist(0, widget.itemCount)
          .contains(oldWidget.items[i])) {
        removeIndices.add(i);
        removeItems.add(oldWidget.items[i]);
      }
    }

    for (int i = 0; i < widget.itemCount; i++) {
      if (!oldWidget.items
          .sublist(0, oldWidget.itemCount)
          .contains(widget.items[i])) {
        insertIndices.add(i);
        insertItems.add(widget.items[i]);
      }
    }

    removeAnyItems(removeIndices, removeItems);
    insertAnyItems(insertIndices, insertItems);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      physics: const NeverScrollableScrollPhysics(),
      initialItemCount: _itemCount,
      itemBuilder: (context, index, animation) {
        return _itemBuilder(_items[index], animation, _onTapItem);
      },
    );
  }

  void insertAnyItems(List<int> indices, List<CarbonCloudState> items) {
    for (int i = 0; i < indices.length; i++) {
      _listKey.currentState?.insertItem(indices[i]);
    }
  }

  void removeAnyItems(List<int> indices, List<CarbonCloudState> items) {
    for (int i = indices.length - 1; i >= 0; i--) {
      _listKey.currentState?.removeItem(indices[i], (context, animation) {
        return _itemBuilder(items[i], animation, null);
      });
    }
  }
}
