import SwiftUI

struct QRCodeScan: UIViewControllerRepresentable {
    typealias UIViewControllerType = <#type#>
 

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
ΩΩ
    func makeUIViewController(context: Context) -> QRCodeScanVC {
        let vc = QRCodeScanVC()
        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ vc: QRCodeScanVC, context: Context) {
    }

    class Coordinator: NSObject, QRCodeScannerDelegate {

        func codeDidFind(_ code: String) {
            print(code)
        }

        var parent: QRCodeScan

        init(_ parent: QRCodeScan) {
            self.parent = parent
        }
    }
}

#if DEBUG
struct QRCodeScan_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScan()
    }
}
#endif

