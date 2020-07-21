class AppState {
  AppState({
    this.user
  });
  dynamic user;
}


AppState appStateReducer(AppState state, dynamic action) => AppState(
  // user: userReduser(state.user,action),
);