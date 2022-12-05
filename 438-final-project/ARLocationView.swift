//
//  ARLocationView.swift
//  arsimplegeolocation
//
//  Used public AR Geo Mapping Repo with permission from Yasuhito Nagatomo on 2022/06/18.
//

import SwiftUI

struct ARLocationView: View {
    
    @ObservedObject var appStateController: AppStateController
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ARContainerView(deviceLocation: appStateController.deviceLocation,
                        modelAssets: appStateController.modelAssets)
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    DeviceLocationView(location: appStateController.deviceLocation)
                    Spacer()
                    Button(action: dismiss.callAsFunction) {
                        Image(systemName: "xmark.square")
                            .font(.title)
                            .scaleEffect(1.5)
                            .padding(40)
                    }
                } // HStack
                Spacer()
            } // VStack
        }
        .onAppear {
            appStateController.startUpdatingLocation()
        }
        .onDisappear {
            appStateController.stopUpdatingLocation()
        }
    }
}

struct ARLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ARLocationView(appStateController: AppStateController())
    }
}

struct DeviceLocationView: View {
    let location: DeviceLocation?
    private var locationString: String {
        var string = "unknown"
        if let location {
            if AppSettings.share.showingCoordinateOfDevice {
                string = "("
                + String(format: "%3.6f", location.latitude) + ", "
                + String(format: "%3.6f", location.longitude)
                + ") "
                + (location.altitude != nil ? String(format: "%4.2f", location.altitude!) : "???")
                + "[m]"
            } else {
                string = "(***.******, ***.******) ****.**"
            }
        }
        return string
    }
    private var accuracyString: String {
        var string = "unknown"
        if let location {
            string = "Accuracy hor: "
                + String(format: "%3.2f", location.horizontalAccuracy) + "[m], ver: "
                + String(format: "%3.2f", location.verticalAccuracy)
                + "[m]"
        }
        return string
    }


    var body: some View {
        VStack {
            Text(locationString)
            Text(accuracyString)
        } // VStack
        .padding()
        .foregroundColor(.white)
        .background(Color.black.cornerRadius(10).opacity(0.5))
        .font(.caption)
    }
}

//    struct DeviceLocationView_Previews: PreviewProvider {
//        static var previews: some View {
//            DeviceLocationView(location: DeviceLocation.zero)
//        }
//    }
