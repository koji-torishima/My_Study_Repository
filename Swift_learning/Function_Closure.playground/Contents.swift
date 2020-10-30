import Foundation

// 処理を一まとまりにできる
// 関数はクロージャーの一種である
// 切り出して処理を書くことによって、メンテナンス性や可読性を高められる

// function

/*
func 関数名(引数名: Type, 引数名: Type ...) -> 戻り値の型 {
    関数呼び出し時に実行される文
    必要に応じてreturn文で戻り値を返却する
}

 */

func double(_ x: Int) -> Int {
    return x * 2
}

double(2) // 4

// 実行方法
// let 定数名　＝　関数名（引数名１：引数１、引数名２：引数２...）

func functionWithDiscardResult() -> String {
    return "Discardable"
}

_ = functionWithDiscardResult() // Discardable

// 引数

func printInt(_ int: Int) {
    print(int)
}

printInt(1) // 1

// 外部引数名と内部引数名
// 外部引数　＝　呼び出し時に使用
// 内部引数　＝　関数内で使用されるもの
/*
 func 関数名（内部引数：　型、　外部引数　内部引数：型）{}
 */


func invite(user: String, to group: String) {
    print("\(user) is invited to \(group)")
}

invite(user: "torishima", to: "kendo club")

// 外部引数の省略　_ これを使用

func sum(_ int1: Int, _ int2: Int) -> Int {
    return int1 + int2
}

sum(10, 10) // 20

// デフォルト引数
// なんでも入れられる

func greet(user: String = "Anonymos") {
    print("Hello \(user)")
}

greet() // Hello Anonymos
greet(user: "koji torishima") // Hello koji torishima

// 検索ワード、ソートキー、昇順かどうかを指定する３つの引数を持っているが、
// 必要なものは検索キーワードだけなので、必要ない引数にはデフォを設定できるため、
// 単に検索キーワードだけで検索したい場合、ソートキーなども指定して検索したい時も、一つの関数で対応できる
func search(byQuery query: String,
            sortKey: String = "id",
            ascending: Bool = false) -> [Int] {
    return [1, 2, 3]
}

search(byQuery: "query")

// インアウト引数
// 関数内での引数への再代入を関数外で行うときは　inout をつける　つけないとerror
// 仮値で入れられる
// inout引数を呼び出すには＆をつける
// つけない時のerror ：Passing value of type 'String' to an inout parameter requires explicit '&'
func greetA(user: inout String) {
    if user.isEmpty {
        user = "Anonymos"
    }
    print("Hello \(user)")
}
var user: String = ""
greetA(user: &user)

// 可変長引数　任意の個数の値を受け取る引数
// メリット　関数の呼び出し側に配列であることを意識させない
// 一つのfunctionに一つまで
//　Array型になる

func printA(strings: String...) {
    if strings.count == 0 {
        return
    }

    print("first: \(strings[0])")

    for str in strings {
        print("element: \(str)")
    }
}

printA(strings: "abc", "def","ghi")

//first: abc
//element: abc
//element: def
//element: ghi

// 引数チェック

func stringA(from: Int) -> String {
    return "\(int)"
}

let int = 1
let double = 1.0

let str1 = stringA(from: int)
// let str2 = stringA(from: double) // error
// Cannot convert value of type 'Double' to expected argument type 'Int'

// 戻り値
// return なし
func greetB(user: String) {
    print("Hello \(user)")
}

greetB(user: "tanaka")
// 上記と同じ

func greetC(user: String) -> Void {
    print("Hello \(user)")
}
greetC(user: "tanaka")

// 暗黙的　return
// 戻り値のみの場合　return 省略きる
func makeMassage(toUser user: String) -> String {
    "Hello, \(user)"
}

// これはerror
// Missing return in a function expected to return 'String'
/*
 戻り値以外もある場合　return は省略できない
func makeMassage1(toUser user: String) -> String {
    print(user)
    "Hello, \(user)"
}
 */

//　クロージャー
/*
 スコープ内の変数や定数の保持した一まとまりの処理
 { (引数1：型、引数２：型）->　戻り値　in
 　　クロージャーの実行時に実行される文
 必要に応じてreturn文で戻り値を返却する
}
 */

// Int型の引数を一つ取り、それを２倍したInt型の戻り値を返す（Int）→ Int型のクロージャーを実行している

let doubleA = {(x: Int) -> Int in
    return x * 2
}
doubleA(2) // 4

// クロージャーの型は通常の方と同じように扱えるので、変数や定数の型や、関数の引数の方としても利用することができる

let closure: (Int) -> Int
func someFunctionAA(x: (Int) -> Int) {}

closure = { int in
    return int * 2
}
closure(1)

//   型推論

var closureA: (String) -> Int

// 引数と戻り値を明示した場合
closureA = { (str: String) -> Int in
    return str.count
}
closureA("abc") // 3

//　省略した場合

closureA = { str in
    return str.count * 2
}
closureA("abc") // 6

// 型が決まってないとerror
// Unable to infer type of a closure parameter 'str' in the current context
//let butClosure = { str in
//    return str.count * 2
//}


// 実行方法
//　呼び出し方は関数と同じ
//　クロージャーが代入されている変数名や定数名の末尾に（）をつけて（）内に引数を　’,’ 区切りで並べる
//　戻り値は変数や定数に代入される
//　let 定数名　＝　変数名（引数１、引数２）

// クロージャーが代入された変数や定数の方は、クロージャーの型として型推論さる

// stringの数をカウントしている
// やってることは同じでも書き方が違う

let lengthOfString = { (string: String) -> Int in  // (String) -> Int
    return string.count
}
lengthOfString("abcdefghijklmnopqrstuvwxyz") // 26


func lengthOfStringA(_ string: String) -> Int {
    return string.count
}
lengthOfStringA("abcdefghijklmnopqrstuvwxyz") // 26

// 引数
//　クロージャーは、外部引数とデフォルト引数が使えない
// 引数省略しているのと同じ

let add = { (x: Int, y: Int) -> Int in
    print(x + y)
    return x + y
}
add(1,2) // 3

func addFunc(_ x: Int, _ y: Int) -> Int {
    print(x + y)
    return x + y
}

addFunc(1, 2) // 3

// 簡略引数 引数名の省略
// $0 とか　$1が使える

let isEqual: (Int, Int) -> Bool = {
    return $0 == $1
}

isEqual(1,1) // true
isEqual(2,1) // false

let keisan: (Int, Int) -> Int = {
    return $0 + $1
}
keisan(1,2) // 3

// 簡略引数を使う場合、クロージャーの定義内では引数の型を指定しないため、外部からの型推論できない場合はerrorになる

// むやみに使うと、引数が何を意味しているのかわからない可読性の低いCodeになりがちだが、
// 非常にシンプルにできるので、積極的に使う方が良い

let numbers = [10,20,30,40]
// 公式
// func filter(_ isIncluded: (Int) throws -> Bool) rethrows -> [Int]
// filter(isIncluded: (Int) throws -> Boo)

// 下記はやっていることは同じだけど、省略しているので読みやすい

let aaaaaa = numbers.filter { val -> Bool in
    val > 20
}
let bbbbbb = numbers.filter { val in
    val > 20
}
let moreThenTwenty = numbers.filter { $0 > 20 }

aaaaaa          // [30, 40]
bbbbbb          // [30, 40]
moreThenTwenty  // [30, 40]

// 戻り値
//　なし
let emptyReturnValueClosure: () -> Void = {}
// 一つあり
let singleReturnValueClosure: () -> Int = { return 1 }
// () とVoidは同じだが、クロージャーの場合戻り値がない場合はVoidを使う
// ❌ () -> ()
// ❌ Void -> Void
// ⭕️ () -> Void

// クロージャーによる変数と定数のキャプチャ

/*
通常ローカルスコープで定義された変数や定数はローカルスコープ外では使用できない、
 一歩クロージャーで参照している変数や定数は
 クロージャーが実行されるスコープが、変数や定数が定義されたローカルスコープ以外であっても
 クロージャーの実行時に利用できる
 これは、クロージャーが自身で定義されたスコープの変数や定数へ参照を保持しているため、
 これをキャプチャという

 */

let greeting: (String) -> String
/*-----------------------------*/
do {
    let symbol = "!"
    greeting = { user in
        return "Hello, \(user)\(symbol)"
    }
}

greeting("koji") // "Hello, koji!"
//　symbol ::: symbolは別スコープで定義されているためerror
//　Cannot find 'symbol' in scope

//　定数　greeting　はdoスコープ外で宣言されているためdoの外でも使用できるが、
//　定数　symbol　は do のスコープ内で宣言されているため外で使えない
//　しかし定数greetingに代入されたクロージャーは内部でsymbolを利用しているにもかかわらず、doの外で実行できる
//　これは、クロージャーがキャプチャによって、自分自身が定義されたスコープの変数や定数への参照を保持することで実現されている
//　キャプチャの対象は変数や定数に入っている値ではなく、その変数や、定数自信である
//　したがって、キャプチャされている変数への変更はクロージャーの実行にも反映される。
//　例
//　以下　定数　counterに代入されたクロージャ は、実行のたびに変数countの値を１増やす
//　変数countの初期値は０ですが、変数そのものをキャプチャしているため、変数に対する更新も保持されます
// そのため、実行するたびに異なる値となる

let counter: () -> Int

do {
    var count = 0
    counter  = {
        count += 1
        return count
    }
}

counter() // 1
counter() // 2
counter() // 3
counter() // 4
counter() // 5

// 引数としてのクロージャ
//　クロージャーを関数や別のクロージャ の引数として利用する場合のみ有効な仕様として、
//　属性とトレイリングクロージャ がある
//　属性はクロージャ に対して指定する追加情報
//　トレイリングクロージャ は引数にとる関数の可読性を高めるための仕様

//　属性の指定
/*
 属性は2つある

  - escaping
  - autoclosure

func 関数名(引数：＠属性名　クロージャ の型名）{
 関数呼び出し時に実行される文
 }

 */

func or(_ lhs: Bool, _ rhs: @autoclosure () -> Bool) -> Bool {
    if lhs {
        return true
    } else {
        return rhs()
    }
}

or(true, false) // true

//　escaping
// ここは大切なので、必ず行う
// 明日書く