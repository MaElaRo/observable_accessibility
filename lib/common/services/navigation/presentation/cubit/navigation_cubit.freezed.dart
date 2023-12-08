// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  BottomTab get bottomTab => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomTab bottomTab) tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomTab bottomTab)? tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomTab bottomTab)? tabSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationTabSelectedState value) tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigationTabSelectedState value)? tabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationTabSelectedState value)? tabSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call({BottomTab bottomTab});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bottomTab = null,
  }) {
    return _then(_value.copyWith(
      bottomTab: null == bottomTab
          ? _value.bottomTab
          : bottomTab // ignore: cast_nullable_to_non_nullable
              as BottomTab,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationTabSelectedStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationTabSelectedStateCopyWith(
          _$NavigationTabSelectedState value,
          $Res Function(_$NavigationTabSelectedState) then) =
      __$$NavigationTabSelectedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BottomTab bottomTab});
}

/// @nodoc
class __$$NavigationTabSelectedStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$NavigationTabSelectedState>
    implements _$$NavigationTabSelectedStateCopyWith<$Res> {
  __$$NavigationTabSelectedStateCopyWithImpl(
      _$NavigationTabSelectedState _value,
      $Res Function(_$NavigationTabSelectedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bottomTab = null,
  }) {
    return _then(_$NavigationTabSelectedState(
      null == bottomTab
          ? _value.bottomTab
          : bottomTab // ignore: cast_nullable_to_non_nullable
              as BottomTab,
    ));
  }
}

/// @nodoc

class _$NavigationTabSelectedState implements NavigationTabSelectedState {
  const _$NavigationTabSelectedState(this.bottomTab);

  @override
  final BottomTab bottomTab;

  @override
  String toString() {
    return 'NavigationState.tabSelected(bottomTab: $bottomTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationTabSelectedState &&
            (identical(other.bottomTab, bottomTab) ||
                other.bottomTab == bottomTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bottomTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationTabSelectedStateCopyWith<_$NavigationTabSelectedState>
      get copyWith => __$$NavigationTabSelectedStateCopyWithImpl<
          _$NavigationTabSelectedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomTab bottomTab) tabSelected,
  }) {
    return tabSelected(bottomTab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomTab bottomTab)? tabSelected,
  }) {
    return tabSelected?.call(bottomTab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomTab bottomTab)? tabSelected,
    required TResult orElse(),
  }) {
    if (tabSelected != null) {
      return tabSelected(bottomTab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationTabSelectedState value) tabSelected,
  }) {
    return tabSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigationTabSelectedState value)? tabSelected,
  }) {
    return tabSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationTabSelectedState value)? tabSelected,
    required TResult orElse(),
  }) {
    if (tabSelected != null) {
      return tabSelected(this);
    }
    return orElse();
  }
}

abstract class NavigationTabSelectedState implements NavigationState {
  const factory NavigationTabSelectedState(final BottomTab bottomTab) =
      _$NavigationTabSelectedState;

  @override
  BottomTab get bottomTab;
  @override
  @JsonKey(ignore: true)
  _$$NavigationTabSelectedStateCopyWith<_$NavigationTabSelectedState>
      get copyWith => throw _privateConstructorUsedError;
}
