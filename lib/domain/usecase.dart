//

abstract class Usecase<A, R> {
  const Usecase();

  R call(A args);
}
