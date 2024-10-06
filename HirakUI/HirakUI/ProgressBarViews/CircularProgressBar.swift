//
//  CircularProgressBar.swift
//  HirakUI
//
//  Created by Hirakjyoti Borah on 05/10/24.
//

import SwiftUI

struct CircularProgressModel {
    let strokeWidth: CGFloat
    let progressColor: Color
    let backgroundColor: Color
    var startValue: Double = 0
    var endValue: Double = 1
    var shouldAnimate: Bool = false
}

struct CircularProgressBar: View {

    @State private var animatedEndValue: Double = 0

    let model: CircularProgressModel

    init(model: CircularProgressModel) {
        self.model = model
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    model.backgroundColor,
                    style: StrokeStyle(lineWidth: model.strokeWidth, lineCap: .round))
            Circle()
                .trim(from: model.startValue, to: model.endValue)
                .stroke(
                    model.progressColor,
                    style: StrokeStyle(lineWidth: model.strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(model.shouldAnimate ? .linear(duration: 1.0) : .none, value: animatedEndValue)
        }
        .onAppear {
            if model.shouldAnimate {
                animatedEndValue = model.endValue
            } else {
                animatedEndValue = model.startValue
            }
        }
        .padding()
        .frame(maxWidth: 300, maxHeight: 300)
    }
}


#Preview {
    CircularProgressBar(
        model: CircularProgressModel(
            strokeWidth: 20,
            progressColor: Color.red,
            backgroundColor: Color.pink.opacity(0.5),
            startValue: 0,
            endValue: 0.75
        )
    )
}
