import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_stats.dart';

// --- Events ---
abstract class DashboardEvent {}
class LoadDashboardData extends DashboardEvent {}

// --- States ---
abstract class DashboardState {}
class DashboardInitial extends DashboardState {} // Initial state
class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
  final DashboardStats stats;
  DashboardLoaded(this.stats);
}
class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

// --- Bloc (Cubit) ---
class DashboardBloc extends Cubit<DashboardState> {
  final DashboardRepository _repository;

  // Constructor mein repository pass karein
  DashboardBloc(this._repository) : super(DashboardInitial());

  void loadStats() async {
    emit(DashboardLoading());
    try {
      // Repository se actual data mangwayein
      // Agar repository async hai toh 'await' use karein
      final stats = _repository.getDashboardData();
      
      emit(DashboardLoaded(stats));
    } catch (e) {
      emit(DashboardError("Data load karne mein masla hua: ${e.toString()}"));
    }
  }
}