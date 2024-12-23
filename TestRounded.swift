import SwiftUI

//【Swift】少数の丸め方あれこれ - rounded()
// https://android.benigumo.com/20240520/swift-rounded/

struct Chart: View {
  var function: (Double) -> Double
  var by: Double

  private let height = 20.0

  private var data: [Double] {
    stride(from: -3.0, to: 3.0 + by , by: by)
      .map { $0 }
  }

  var body: some View {
    ZStack {
      ForEach(data, id: \.self) { n in
        Rectangle()
          .fill(Color.data[Int(function(n)) + 3])
          .frame(width: 50 * by, height: height)
          .position(CGPoint(x: 50 * n + 150, y: height / 2))
      }
    }
  }
}

struct TestRounded: View {

  var body: some View {

    ZStack {
      VStack {

        ZStack {
          LinearGradient(colors: Color.data, startPoint: .leading, endPoint: .trailing)
            .frame(height: 20)
          ForEach(0 ... 6, id: \.self) { i in
            Text("\(i - 3)")
              .foregroundStyle(.background)
              .padding(.vertical, 4)
              .padding(.horizontal)
              .background(Color.data[i])
              .position(CGPoint(x: 50 * i, y: -15))
          }
        }

        Text("rounded()")
        Text("rounded(.toNearestOrAwayFromZero)")
        Text("schoolbook rounding")
        Chart(function: { $0.rounded() }, by: 0.01)
        //Chart(function: { $0.rounded(.toNearestOrAwayFromZero) }, by: 0.01)

        Text("rounded(.down)")
        Chart(function: { $0.rounded(.down) }, by: 0.01)

        Text("rounded(.up)")
        Chart(function: { $0.rounded(.up) }, by: 0.01)

        Text("rounded(.towardZero)")
        Chart(function: { $0.rounded(.towardZero) }, by: 0.01)

        Text("rounded(.awayFromZero)")
        Chart(function: { $0.rounded(.awayFromZero) }, by: 0.01)

        Text("rounded(.toNearestOrEven)")
        Text("bankers rounding")
        Chart(function: { $0.rounded(.toNearestOrEven) }, by: 0.01)

      }
      .font(.caption2)
      .background()

      ForEach(0 ... 120, id: \.self) { j in
        ForEach(0 ... 60, id: \.self) { i in
          let size = i % 10 == 0 ? 2.0 : 1.0
          Circle()
            .fill(.gray)
            .frame(width: size, height: size)
            .position(CGPoint(x: 5 * i, y: 5 * j))
        }
      }

    }
    .frame(width: 300, height: 600)
    .padding()

    .onAppear {
      // rounded(_:) | Apple Developer Documentation
      // https://developer.apple.com/documentation/swift/double/rounded(_:)

      // FloatingPointRoundingRule | Apple Developer Documentation
      // https://developer.apple.com/documentation/swift/floatingpointroundingrule

      [5.2, 5.5, -5.2, -5.5, 0.51, 0.0, 0.03, 1.001]
        .forEach {
          print($0)
          print(".rounded()", $0.rounded())
          print(".rounded(.down)", $0.rounded(.down))
          print(".rounded(.up)", $0.rounded(.up))
          print(".rounded(.towardZero)", $0.rounded(.towardZero))
          print(".rounded(.awayFromZero)", $0.rounded(.awayFromZero))
          print(".rounded(.toNearestOrEven)", $0.rounded(.toNearestOrEven))
          print(".rounded(.toNearestOrAwayFromZero)", $0.rounded(.toNearestOrAwayFromZero))
          print()
        }
    }

  }
}

fileprivate extension Color {
  static var data: [Color] {
    [.blue, .green, .red, .black, .red, .green, .blue]
  }
}

#Preview {
  TestRounded()
}
