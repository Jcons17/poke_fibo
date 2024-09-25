// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import '../../core.dart';

class LoadedDataBuilder<T> extends StatelessWidget {
  final LoadedData<T>? data;

  final Widget Function(BuildContext context, T data) onData;
  final Widget Function(BuildContext context, Exception data)? onException;
  final Widget Function(BuildContext context, T? cachedData) onLoading;
  final Widget Function(BuildContext context)? onEmpty;
  final Duration transitionDuration;

  /// Some time you won't prefer to implement an internal animationSwitcher since it could
  /// conflict with your layout structure , like inside a SliverWidget
  /// Defaults to true
  final bool animated;

  /// A function to implement a custom wrapper for the corresponding rendered Widget
  /// This is useful if we want to implement a custom animated switcher
  final Widget Function(BuildContext context, Widget child)? wrapper;

  const LoadedDataBuilder({
    Key? key,
    required this.data,
    required this.onData,
    this.onException,
    required this.onLoading,
    this.onEmpty,
    this.transitionDuration = const Duration(milliseconds: 450),
    this.animated = true,
    this.wrapper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (data == null) {
      child = onEmpty?.call(context) ?? const SizedBox.shrink();
    } else if (data!.loading) {
      child = onLoading.call(context, data?.value);
    } else {
      child = data!.data?.fold(
            (failure) {
              return onException?.call(context, failure);
            },
            (data) {
              return onData(context, data);
            },
          ) ??
          onEmpty?.call(context) ??
          const SizedBox.shrink();
    }

    if (wrapper != null) {
      child = wrapper!(context, child);
    }

    if (!animated) return child;

    return AnimatedSwitcher(
      duration: transitionDuration,
      child: child,
    );
  }
}
