import 'package:dartz/dartz.dart';

class LoadedData<T> {
  final bool loading;
  final int? timestamp;
  final Either<Exception, T>? data;

  bool get errored {
    return data?.isLeft() ?? false;
  }

  T? get value {
    return data?.fold((_) => null, (value) => value);
  }

  Exception? get exception {
    return data?.fold((exception) => exception, (_) => null);
  }

  const LoadedData({
    this.loading = false,
    this.timestamp,
    this.data,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoadedData<T> && other.loading == loading && other.timestamp == timestamp && other.data == data;
  }

  @override
  int get hashCode => loading.hashCode ^ timestamp.hashCode ^ data.hashCode;

  LoadedData<T> copyWith({
    bool? loading,
    int? timestamp,
    Either<Exception, T>? data,
  }) {
    return LoadedData<T>(
      loading: loading ?? this.loading,
      timestamp: timestamp ?? this.timestamp,
      data: data ?? this.data,
    );
  }

  LoadedData<T> copyWithData({
    bool loading = false,
    Either<Exception, T>? data,
  }) {
    return LoadedData<T>(
      loading: loading,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      data: data ?? this.data,
    );
  }

  LoadedData<T> copyWithLoading() {
    return LoadedData<T>(
      loading: true,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      data: data ?? this.data,
    );
  }

  @override
  String toString() => 'LoadedData(loading: $loading, timestamp: $timestamp, data: $data)';
}
