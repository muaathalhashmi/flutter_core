import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class ListPagination extends StatefulWidget {
  const ListPagination(
      {Key? key, required this.onLoadMore, required this.shimmerWidget})
      : super(key: key);

  final Function onLoadMore;
  final Widget shimmerWidget;

  @override
  State<ListPagination> createState() => _ListPaginationState();
}

class _ListPaginationState extends State<ListPagination>
    with AutomaticKeepAliveClientMixin, AfterLayoutMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void afterFirstLayout(BuildContext context) {
    widget.onLoadMore();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.shimmerWidget;
  }
}
