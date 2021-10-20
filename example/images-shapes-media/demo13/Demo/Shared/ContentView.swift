//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI


@ViewBuilder
func waitView() -> some View {
   VStack {
       if #available(iOS 15.0, *) {
           ProgressView()
               .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
       } else {
           // Fallback on earlier versions
       }
       Text("Fetching image...")
   }
}
struct AvatarsView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(
                url: URL(string: "https://avatars.githubusercontent.com/u/1680273?v=4"),
                transaction: Transaction(animation: .easeInOut(duration: 2.5))
            ) { phase in
                switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding()
             
                    case .failure(let error):
                        Text(error.localizedDescription)
             
                    case .empty:
                        waitView()
             
                    @unknown default:
                        EmptyView()
                }
            }
            .frame(width: 128, height: 128)

        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            AvatarsView()

            AsyncImage(url: URL(string: "https://jaywcjlove.github.io/swiftui-example/example/images-shapes-media/demo13/imgs/avatars@2x.png"), scale: 2) { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            } placeholder: {
                Color.red
            }
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))

//            AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/1680273?v=4")) { image in
//                image.resizable()
//            } placeholder: {
//                Color.red
//            }
//            .frame(width: 128, height: 128)
//            .clipShape(RoundedRectangle(cornerRadius: 25))
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
