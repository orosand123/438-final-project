
//  Used public AR Geo Mapping Repo with permission from Yasuhito Nagatomo on 2022/06/18.

import SwiftUI

struct HomeView: View {
    @StateObject private var appStateController = AppStateController()
    @State private var isShowingAR = true
    @State private var isShowingSettings = false

    var body: some View {
        ZStack {
            Color("HomeBGColor").ignoresSafeArea()

            VStack {
                HStack {
                    Spacer()
//                    Button(action: { isShowingSettings = true },
//                           label: {
//                            Image(systemName: "gearshape")
//                                .font(.largeTitle)
//                                .padding(.horizontal, 40)
//                            })
                }
                Spacer()
                Group {
                    Image(systemName: "camera.viewfinder")
                        .font(.system(size: 80))
                        .padding()
                    Text("WashU AR Map")
                        .font(.title2)
                }
                .foregroundColor(.white)

                Spacer()

//                Button("Begin", action: {
//                    isShowingAR = true
//                })
                .buttonStyle(.borderedProminent)
                .padding(40)
                .disabled(!appStateController.locationServicesAuthorized)
            } // VStack
        } // ZStack
        .controlSize(.large)
        .onAppear {
            appStateController.requestAuthorization()
        }
        .fullScreenCover(isPresented: $isShowingAR) {
            ARLocationView(appStateController: appStateController)
        }
        .fullScreenCover(isPresented: $isShowingSettings) {
            SettingsView(appState: appStateController)
        }
    } // body
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
