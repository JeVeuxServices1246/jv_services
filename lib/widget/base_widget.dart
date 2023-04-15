import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/base_vm.dart';
/*abstract class BaseWidget<V extends BaseViewModel> extends StatelessWidget {
  const BaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => setViewModel(context),
      child: Consumer<V>(builder: (context, viewModel, child) {
        V viewModel = context.watch<V>();
        return buildUI(context, viewModel);
      }),
    );
  }

  @protected
  Widget buildUI(BuildContext context, V viewModel);

  @protected
  V setViewModel(BuildContext context);
}*/
abstract class BaseWidget<V extends BaseViewModel> extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState<V>();

  @protected
  Widget buildUI(BuildContext context, V viewModel);

}

class _BaseWidgetState<V extends BaseViewModel> extends State<BaseWidget> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin  {
  late V v;

  @override
  void initState() {
    v = context.read<V>();
    v.setContext(context);
    v.initView();
    v.initAnimation(this);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.buildUI(context,context.watch<V>());
  }

  @override
  void dispose() {
    v.disposeView();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
