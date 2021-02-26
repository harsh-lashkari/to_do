// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'note_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NoteFormEventTearOff {
  const _$NoteFormEventTearOff();

// ignore: unused_element
  _Initialized initialized(Option<Note> initialNoteOption) {
    return _Initialized(
      initialNoteOption,
    );
  }

// ignore: unused_element
  _TitleChanged titleChanged(String titleStr) {
    return _TitleChanged(
      titleStr,
    );
  }

// ignore: unused_element
  _BodyChanged bodyChanged(String bodyStr) {
    return _BodyChanged(
      bodyStr,
    );
  }

// ignore: unused_element
  _ColorChanged colorChanged(Color color) {
    return _ColorChanged(
      color,
    );
  }

// ignore: unused_element
  _TodoChanged todoChanged(KtList<TodoItemPrimitive> todo) {
    return _TodoChanged(
      todo,
    );
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $NoteFormEvent = _$NoteFormEventTearOff();

/// @nodoc
mixin _$NoteFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NoteFormEventCopyWith<$Res> {
  factory $NoteFormEventCopyWith(
          NoteFormEvent value, $Res Function(NoteFormEvent) then) =
      _$NoteFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteFormEventCopyWithImpl<$Res>
    implements $NoteFormEventCopyWith<$Res> {
  _$NoteFormEventCopyWithImpl(this._value, this._then);

  final NoteFormEvent _value;
  // ignore: unused_field
  final $Res Function(NoteFormEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Note> initialNoteOption});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object initialNoteOption = freezed,
  }) {
    return _then(_Initialized(
      initialNoteOption == freezed
          ? _value.initialNoteOption
          : initialNoteOption as Option<Note>,
    ));
  }
}

/// @nodoc
class _$_Initialized implements _Initialized {
  const _$_Initialized(this.initialNoteOption)
      : assert(initialNoteOption != null);

  @override
  final Option<Note> initialNoteOption;

  @override
  String toString() {
    return 'NoteFormEvent.initialized(initialNoteOption: $initialNoteOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.initialNoteOption, initialNoteOption) ||
                const DeepCollectionEquality()
                    .equals(other.initialNoteOption, initialNoteOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialNoteOption);

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return initialized(initialNoteOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(initialNoteOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements NoteFormEvent {
  const factory _Initialized(Option<Note> initialNoteOption) = _$_Initialized;

  Option<Note> get initialNoteOption;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith;
}

/// @nodoc
abstract class _$TitleChangedCopyWith<$Res> {
  factory _$TitleChangedCopyWith(
          _TitleChanged value, $Res Function(_TitleChanged) then) =
      __$TitleChangedCopyWithImpl<$Res>;
  $Res call({String titleStr});
}

/// @nodoc
class __$TitleChangedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$TitleChangedCopyWith<$Res> {
  __$TitleChangedCopyWithImpl(
      _TitleChanged _value, $Res Function(_TitleChanged) _then)
      : super(_value, (v) => _then(v as _TitleChanged));

  @override
  _TitleChanged get _value => super._value as _TitleChanged;

  @override
  $Res call({
    Object titleStr = freezed,
  }) {
    return _then(_TitleChanged(
      titleStr == freezed ? _value.titleStr : titleStr as String,
    ));
  }
}

/// @nodoc
class _$_TitleChanged implements _TitleChanged {
  const _$_TitleChanged(this.titleStr) : assert(titleStr != null);

  @override
  final String titleStr;

  @override
  String toString() {
    return 'NoteFormEvent.titleChanged(titleStr: $titleStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TitleChanged &&
            (identical(other.titleStr, titleStr) ||
                const DeepCollectionEquality()
                    .equals(other.titleStr, titleStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(titleStr);

  @JsonKey(ignore: true)
  @override
  _$TitleChangedCopyWith<_TitleChanged> get copyWith =>
      __$TitleChangedCopyWithImpl<_TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return titleChanged(titleStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (titleChanged != null) {
      return titleChanged(titleStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class _TitleChanged implements NoteFormEvent {
  const factory _TitleChanged(String titleStr) = _$_TitleChanged;

  String get titleStr;
  @JsonKey(ignore: true)
  _$TitleChangedCopyWith<_TitleChanged> get copyWith;
}

/// @nodoc
abstract class _$BodyChangedCopyWith<$Res> {
  factory _$BodyChangedCopyWith(
          _BodyChanged value, $Res Function(_BodyChanged) then) =
      __$BodyChangedCopyWithImpl<$Res>;
  $Res call({String bodyStr});
}

/// @nodoc
class __$BodyChangedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$BodyChangedCopyWith<$Res> {
  __$BodyChangedCopyWithImpl(
      _BodyChanged _value, $Res Function(_BodyChanged) _then)
      : super(_value, (v) => _then(v as _BodyChanged));

  @override
  _BodyChanged get _value => super._value as _BodyChanged;

  @override
  $Res call({
    Object bodyStr = freezed,
  }) {
    return _then(_BodyChanged(
      bodyStr == freezed ? _value.bodyStr : bodyStr as String,
    ));
  }
}

/// @nodoc
class _$_BodyChanged implements _BodyChanged {
  const _$_BodyChanged(this.bodyStr) : assert(bodyStr != null);

  @override
  final String bodyStr;

  @override
  String toString() {
    return 'NoteFormEvent.bodyChanged(bodyStr: $bodyStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BodyChanged &&
            (identical(other.bodyStr, bodyStr) ||
                const DeepCollectionEquality().equals(other.bodyStr, bodyStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bodyStr);

  @JsonKey(ignore: true)
  @override
  _$BodyChangedCopyWith<_BodyChanged> get copyWith =>
      __$BodyChangedCopyWithImpl<_BodyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return bodyChanged(bodyStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (bodyChanged != null) {
      return bodyChanged(bodyStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return bodyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (bodyChanged != null) {
      return bodyChanged(this);
    }
    return orElse();
  }
}

abstract class _BodyChanged implements NoteFormEvent {
  const factory _BodyChanged(String bodyStr) = _$_BodyChanged;

  String get bodyStr;
  @JsonKey(ignore: true)
  _$BodyChangedCopyWith<_BodyChanged> get copyWith;
}

/// @nodoc
abstract class _$ColorChangedCopyWith<$Res> {
  factory _$ColorChangedCopyWith(
          _ColorChanged value, $Res Function(_ColorChanged) then) =
      __$ColorChangedCopyWithImpl<$Res>;
  $Res call({Color color});
}

/// @nodoc
class __$ColorChangedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$ColorChangedCopyWith<$Res> {
  __$ColorChangedCopyWithImpl(
      _ColorChanged _value, $Res Function(_ColorChanged) _then)
      : super(_value, (v) => _then(v as _ColorChanged));

  @override
  _ColorChanged get _value => super._value as _ColorChanged;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_ColorChanged(
      color == freezed ? _value.color : color as Color,
    ));
  }
}

/// @nodoc
class _$_ColorChanged implements _ColorChanged {
  const _$_ColorChanged(this.color) : assert(color != null);

  @override
  final Color color;

  @override
  String toString() {
    return 'NoteFormEvent.colorChanged(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorChanged &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  _$ColorChangedCopyWith<_ColorChanged> get copyWith =>
      __$ColorChangedCopyWithImpl<_ColorChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return colorChanged(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (colorChanged != null) {
      return colorChanged(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return colorChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (colorChanged != null) {
      return colorChanged(this);
    }
    return orElse();
  }
}

abstract class _ColorChanged implements NoteFormEvent {
  const factory _ColorChanged(Color color) = _$_ColorChanged;

  Color get color;
  @JsonKey(ignore: true)
  _$ColorChangedCopyWith<_ColorChanged> get copyWith;
}

/// @nodoc
abstract class _$TodoChangedCopyWith<$Res> {
  factory _$TodoChangedCopyWith(
          _TodoChanged value, $Res Function(_TodoChanged) then) =
      __$TodoChangedCopyWithImpl<$Res>;
  $Res call({KtList<TodoItemPrimitive> todo});
}

/// @nodoc
class __$TodoChangedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$TodoChangedCopyWith<$Res> {
  __$TodoChangedCopyWithImpl(
      _TodoChanged _value, $Res Function(_TodoChanged) _then)
      : super(_value, (v) => _then(v as _TodoChanged));

  @override
  _TodoChanged get _value => super._value as _TodoChanged;

  @override
  $Res call({
    Object todo = freezed,
  }) {
    return _then(_TodoChanged(
      todo == freezed ? _value.todo : todo as KtList<TodoItemPrimitive>,
    ));
  }
}

/// @nodoc
class _$_TodoChanged implements _TodoChanged {
  const _$_TodoChanged(this.todo) : assert(todo != null);

  @override
  final KtList<TodoItemPrimitive> todo;

  @override
  String toString() {
    return 'NoteFormEvent.todoChanged(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoChanged &&
            (identical(other.todo, todo) ||
                const DeepCollectionEquality().equals(other.todo, todo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(todo);

  @JsonKey(ignore: true)
  @override
  _$TodoChangedCopyWith<_TodoChanged> get copyWith =>
      __$TodoChangedCopyWithImpl<_TodoChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return todoChanged(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (todoChanged != null) {
      return todoChanged(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return todoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (todoChanged != null) {
      return todoChanged(this);
    }
    return orElse();
  }
}

abstract class _TodoChanged implements NoteFormEvent {
  const factory _TodoChanged(KtList<TodoItemPrimitive> todo) = _$_TodoChanged;

  KtList<TodoItemPrimitive> get todo;
  @JsonKey(ignore: true)
  _$TodoChangedCopyWith<_TodoChanged> get copyWith;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc
class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'NoteFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Note> initialNoteOption),
    @required TResult titleChanged(String titleStr),
    @required TResult bodyChanged(String bodyStr),
    @required TResult colorChanged(Color color),
    @required TResult todoChanged(KtList<TodoItemPrimitive> todo),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Note> initialNoteOption),
    TResult titleChanged(String titleStr),
    TResult bodyChanged(String bodyStr),
    TResult colorChanged(Color color),
    TResult todoChanged(KtList<TodoItemPrimitive> todo),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult titleChanged(_TitleChanged value),
    @required TResult bodyChanged(_BodyChanged value),
    @required TResult colorChanged(_ColorChanged value),
    @required TResult todoChanged(_TodoChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(titleChanged != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todoChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult titleChanged(_TitleChanged value),
    TResult bodyChanged(_BodyChanged value),
    TResult colorChanged(_ColorChanged value),
    TResult todoChanged(_TodoChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements NoteFormEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$NoteFormStateTearOff {
  const _$NoteFormStateTearOff();

// ignore: unused_element
  _NoteFormState call(
      {@required Note note,
      @required bool showErrorMessages,
      @required bool isSaving,
      @required bool isEditing,
      @required Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption}) {
    return _NoteFormState(
      note: note,
      showErrorMessages: showErrorMessages,
      isSaving: isSaving,
      isEditing: isEditing,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NoteFormState = _$NoteFormStateTearOff();

/// @nodoc
mixin _$NoteFormState {
  Note get note;
  bool get showErrorMessages;
  bool get isSaving;
  bool get isEditing;
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccessOption;

  @JsonKey(ignore: true)
  $NoteFormStateCopyWith<NoteFormState> get copyWith;
}

/// @nodoc
abstract class $NoteFormStateCopyWith<$Res> {
  factory $NoteFormStateCopyWith(
          NoteFormState value, $Res Function(NoteFormState) then) =
      _$NoteFormStateCopyWithImpl<$Res>;
  $Res call(
      {Note note,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$NoteFormStateCopyWithImpl<$Res>
    implements $NoteFormStateCopyWith<$Res> {
  _$NoteFormStateCopyWithImpl(this._value, this._then);

  final NoteFormState _value;
  // ignore: unused_field
  final $Res Function(NoteFormState) _then;

  @override
  $Res call({
    Object note = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed ? _value.note : note as Note,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<NoteFailure, Unit>>,
    ));
  }

  @override
  $NoteCopyWith<$Res> get note {
    if (_value.note == null) {
      return null;
    }
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc
abstract class _$NoteFormStateCopyWith<$Res>
    implements $NoteFormStateCopyWith<$Res> {
  factory _$NoteFormStateCopyWith(
          _NoteFormState value, $Res Function(_NoteFormState) then) =
      __$NoteFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Note note,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$NoteFormStateCopyWithImpl<$Res>
    extends _$NoteFormStateCopyWithImpl<$Res>
    implements _$NoteFormStateCopyWith<$Res> {
  __$NoteFormStateCopyWithImpl(
      _NoteFormState _value, $Res Function(_NoteFormState) _then)
      : super(_value, (v) => _then(v as _NoteFormState));

  @override
  _NoteFormState get _value => super._value as _NoteFormState;

  @override
  $Res call({
    Object note = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_NoteFormState(
      note: note == freezed ? _value.note : note as Note,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<NoteFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_NoteFormState implements _NoteFormState {
  const _$_NoteFormState(
      {@required this.note,
      @required this.showErrorMessages,
      @required this.isSaving,
      @required this.isEditing,
      @required this.saveFailureOrSuccessOption})
      : assert(note != null),
        assert(showErrorMessages != null),
        assert(isSaving != null),
        assert(isEditing != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final Note note;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final bool isEditing;
  @override
  final Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'NoteFormState(note: $note, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteFormState &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$NoteFormStateCopyWith<_NoteFormState> get copyWith =>
      __$NoteFormStateCopyWithImpl<_NoteFormState>(this, _$identity);
}

abstract class _NoteFormState implements NoteFormState {
  const factory _NoteFormState(
          {@required
              Note note,
          @required
              bool showErrorMessages,
          @required
              bool isSaving,
          @required
              bool isEditing,
          @required
              Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption}) =
      _$_NoteFormState;

  @override
  Note get note;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$NoteFormStateCopyWith<_NoteFormState> get copyWith;
}
