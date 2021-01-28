import Combine

final class OptionsModelData: ObservableObject {
    @Published var imageType: String = "ASCII"
    @Published var options: [Bool] = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
    
//    @Published var user: String = "ASCII"
//    @Published var os: String = "ASCII"
//    @Published var host: String = "ASCII"
//    @Published var kernel: String = "ASCII"
//    @Published var uptime: String = "ASCII"
//    @Published var packages: String = "ASCII"
//    @Published var shell: String = "ASCII"
//    @Published var resolution: String = "ASCII"
//    @Published var de: String = "ASCII"
//    @Published var vm: String = "ASCII"
//    @Published var wmTheme: String = "ASCII"
//    @Published var terminal: String = "ASCII"
//    @Published var terminalFont: String = "ASCII"
//    @Published var cpu: String = "ASCII"
//    @Published var gpu: String = "ASCII"
//    @Published var memory: String = "ASCII"
//    @Published var swatch: [String] = ["ASCII"]
}
