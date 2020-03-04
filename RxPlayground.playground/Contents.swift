import UIKit
import RxSwift
import RxCocoa

//example(of: "just, of, from", action: {
//    let one = 1
//    let two = 2
//    let three = 3
//    let observable = Observable<Int>.just(one)
//    let observable2 = Observable.of(one, two, three)
//    let observable3 = Observable.of([one, two, three])
//    let observable4 = Observable.from([one, two, three])
//
//})

//example(of: "subscribe") {
//      let one = 1
//      let two = 2
//      let three = 3
//    let observable = Observable.of(one, two, three)
//
//    observable.subscribe { (event) in
//
//
//        if let element = event.element {
//            print(element)
//        }
//    }
//    observable.subscribe(onNext: { (element) in
//        print(element)
//    })
//
//}
//example(of: "empty") {
//    let observable = Observable<Void>.empty()
//    observable.subscribe(onNext: { (element) in
//        print(element)
//    }, onCompleted: {
//        print("Completed")
//    })
//}


//example(of: "never") {
//    let observable = Observable<Any>.never()
//    observable.subscribe(onNext: { (element) in
//        print(element)
//    }, onCompleted: {
//        print("Complete")
//    })
//}

//example(of: "range") {
//    let observable = Observable<Int>.range(start: 1, count: 10)
//    observable.subscribe(onNext: { i in
//        let n = Double(i)
//        let fibonacci = Int(((pow(1.61803, n) - pow(0.61803, n)) / 2.23606).rounded())
//        print(fibonacci)
//    })
//}

//example(of: "dispose") {
//    let observable = Observable.of("A", "B", "C")
//    let subscribtion = observable.subscribe { (event) in
//        print(event)
//    }
//    subscribtion.dispose()
//}
//example(of: "DisposeBag") {
//    let disposeBag = DisposeBag()
//    Observable.of("A", "B", "C").subscribe { print($0)
//    }.disposed(by: disposeBag)
//}


////MARK: - MEMORY LEAK LOWER BY TEXT
//example(of: "create") {
//
//    enum MyError: Error {
//      case anError
//    }
//
//    let disposeBag = DisposeBag()
//    Observable<String>.create {  observer in
//        observer.onNext("1")
////        observer.onError(MyError.anError)
////        observer.onCompleted()
//        observer.onNext("?")
//        return Disposables.create()
//    }.subscribe(onNext: {
//        print($0)
//    }, onError: { print($0)
//    }, onCompleted: {
//        print("Completed")
//    }) {
//        print("Disposed")
//    }
////    .disposed(by: disposeBag)
//}

//example(of: "deffered") {
//    let disposeBag = DisposeBag()
//    var flip: Bool = false
//
//    let factory: Observable<Int> = Observable.deferred {
//
//        flip.toggle()
//
//        if flip {
//            return Observable.of(1, 2, 3)
//        } else {
//            return Observable.of(4,5,6)
//        }
//
//    }
//
//    for _ in 0...3 {
//        factory.subscribe(onNext: {
//            print($0, terminator: "")
//
//            }) .disposed(by: disposeBag)
//          print()
//    }
//
//}
// MARK: -- TRAITS ("light version of Observables")

//example(of: "Single") {
//    let disposeBag = DisposeBag()
//
//    enum FileReadError: Error {
//        case fileNotFound, unreadable, encodingFailed
//    }
//
//    func loadText(from name: String) -> Single<String> {
//        return Single.create {  single  in
//            let disposable = Disposables.create()
//            guard let path = Bundle.main.path(forResource: name, ofType: "txt") else {
//                single(.error(FileReadError.fileNotFound))
//                return disposable
//            }
//            guard let data = FileManager.default.contents(atPath: path) else {
//                single(.error(FileReadError.unreadable))
//                return disposable
//            }
//
//            guard let contents = String(data: data, encoding: .utf8) else {
//                single(.error(FileReadError.encodingFailed))
//                return disposable
//            }
//            single(.success(contents))
//            return disposable
//        }
//    }
//
//    loadText(from: "Copyright").subscribe {
//
//        switch $0 {
//        case .success(let string): print(string)
//        case .error(let error): print(error)
//        }
//    }.disposed(by: disposeBag)
//}

// MARK: -- Subjects

//example(of: "Publish subject") {
//    let subject = PublishSubject<String>()
//    subject.onNext("Is anyone listening?")
//
//    let subscriptionOne = subject.subscribe(onNext: { string in
//        print(string)
//    })
//
//    subject.on(.next("1"))
//    subject.onNext("2")
//
//    let subscriptionTwo = subject.subscribe { (event) in
//        print("2)", event.element ?? event)
//
//    }
//
//    subject.onNext("3")
//
//    subscriptionOne.dispose()
//
//    subject.onNext("4")
//    subject.onCompleted()
//    subject.onNext("5")
//    subscriptionTwo.dispose()
//
//    let disposeBag = DisposeBag()
//
//    subject.subscribe {
//        print("3)", $0.element ?? $0)
//    }.disposed(by: disposeBag)
//    subject.onNext("?")
//
//}

// MARK: -- Behavior Subjects
//enum MyError: Error {
//    case anError
//}
//func printCustom<T: CustomStringConvertible>(label: String, event: Event<T>) {
//    print(label, (event.element ?? event.error) ?? event)
//}
//
//example(of: "Behavior Subject") {
//    let subject = BehaviorSubject(value: "Initial value")
//    let disposeBag = DisposeBag()
//
//    subject.onNext("X")
//
//    subject.subscribe {
//        printCustom(label: "1)", event: $0)
//    }.disposed(by: disposeBag)
//
//    subject.onError(MyError.anError)
//    subject.subscribe {
//        printCustom(label: "2)", event: $0)
//    }.disposed(by: disposeBag)
//
//
//}

//MARK: --REPLAY SUBJECT

//example(of: <#T##String#>, action: <#T##() -> Void#>)


//example(of: <#T##String#>, action: <#T##() -> Void#>)
//example(of: <#T##String#>, action: <#T##() -> Void#>)
