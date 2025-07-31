import 'package:dashboard/data/info_repository.dart';
import 'package:dashboard/models/info_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class InfoEvent extends Equatable {
  const InfoEvent();

  @override
  List<Object> get props => [];
}

class LoadInfo extends InfoEvent {}

class ToggleExpand extends InfoEvent {
  final String id;

  const ToggleExpand(this.id);

  @override
  List<Object> get props => [id];
}

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  final List<InfoItem> infoItems;
  final Map<String, bool> expandedStates;

  const InfoLoaded({required this.infoItems, this.expandedStates = const {}});

  InfoLoaded copyWith({
    List<InfoItem>? infoItems,
    Map<String, bool>? expandedStates,
  }) {
    return InfoLoaded(
      infoItems: infoItems ?? this.infoItems,
      expandedStates: expandedStates ?? this.expandedStates,
    );
  }

  @override
  List<Object> get props => [infoItems, expandedStates];
}

class InfoError extends InfoState {
  final String message;

  const InfoError(this.message);

  @override
  List<Object> get props => [message];
}

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final InfoRepository infoRepository;

  InfoBloc({required this.infoRepository}) : super(InfoLoading()) {
    on<LoadInfo>(_onLoadInfo);
    on<ToggleExpand>(_onToggleExpand);
  }

  Future<void> _onLoadInfo(LoadInfo event, Emitter<InfoState> emit) async {
    try {
      final infoItems = await infoRepository.fetchInfoItems();
      final Map<String, bool> initialExpandedStates = {
        for (var item in infoItems) item.id: false,
      };
      emit(
        InfoLoaded(infoItems: infoItems, expandedStates: initialExpandedStates),
      );
    } catch (e) {
      emit(InfoError(e.toString()));
    }
  }

  void _onToggleExpand(ToggleExpand event, Emitter<InfoState> emit) {
    if (state is InfoLoaded) {
      final currentState = state as InfoLoaded;
      final newExpandedStates = Map<String, bool>.from(
        currentState.expandedStates,
      );
      newExpandedStates[event.id] = !(newExpandedStates[event.id] ?? false);

      emit(currentState.copyWith(expandedStates: newExpandedStates));
    }
  }
}
